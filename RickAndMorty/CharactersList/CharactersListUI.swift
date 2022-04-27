import UIKit

import UIKitReusable
import SwiftBackwardArrow


final class CharactersListUI: UITableViewController {

    init() {
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CharactersListUICell.self)
        tableView.separatorStyle = .none
        tableView.backgroundView = indicator
        presenter.load()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        assert(section == 0)
        return presenter.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        assert(indexPath.section == 0)
        let model = presenter.cell(for: indexPath.row)
        return tableView.dequeue(CharactersListUICell.self, for: indexPath) { cell in
            cell.set(model: model)
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        assert(indexPath.section == 0)
        presenter.selectRow(at: indexPath.row)
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // https://stackoverflow.com/a/51655105
        let isReachingEnd = scrollView.contentOffset.y >= 0
              && scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)
        if isReachingEnd {
            presenter.didScrollToTheEnd()
        }
    }


    // MARK: private

    private lazy var presenter: CharactersListMVPViewPresenter = CharactersListPresenter(
        view: self,
        model: CharactersListInteractor()
    )

    private let indicator: UIActivityIndicatorView = .init(style: .large) <- {
        $0.hidesWhenStopped = true
    }

}


extension CharactersListUI: CharactersListMVPView {

    func set(title: String?) {
        self.title = title
    }

    func routeToDetails(id: Int) {
        navigationController?.pushViewController(CharacterDetailsUI(id: id), animated: true)
    }

    func set(isLoading: Bool) {
        if isLoading {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
    }

    func reloadCells() {
        tableView.reloadData()
    }

    func present(error: CharactersListMVPErrorModal) {
        let vc = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        vc.addAction(.init(title: error.buttonTitle, style: .default, handler: nil))
        present(vc, animated: true, completion: nil)
    }

}
