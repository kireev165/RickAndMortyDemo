import UIKit

import SwiftBackwardArrow
import UIKitReusable


final class CharacterDetailsUI: UITableViewController {

    init(id: Int) {
        super.init(style: .plain)
        presenter = CharacterDetailsPresenter(view: self, model: CharacterDetailsInteractor(id: id))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CharacterDetailsUIImageCell.self)
        tableView.register(CharacterDetailsUITitledValueCell.self)
        tableView.backgroundView = indicator
        tableView.separatorStyle = .none
        presenter.load()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        assert(section == 0)
        return presenter.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        assert(indexPath.section == 0)
        let cellModel = presenter.cell(for: indexPath.row)
        switch cellModel {
        case .image(let url):
            return tableView.dequeue(CharacterDetailsUIImageCell.self, for: indexPath) { cell in
                cell.set(url: url)
            }
        case .titledValue(title: let title, value: let value):
            return tableView.dequeue(CharacterDetailsUITitledValueCell.self, for: indexPath) { cell in
                cell.set(title: title, value: value)
            }
        }
    }


    // MARK: private

    private var presenter: CharacterDetailsMVPViewPresenter!

    private let indicator: UIActivityIndicatorView = .init(style: .large) <- {
        $0.hidesWhenStopped = true
    }

}


extension CharacterDetailsUI: CharacterDetailsMVPView {

    func set(isLoading: Bool) {
        if isLoading{
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
    }

    func set(title: String?) {
        self.title = title
    }

    func reloadTable() {
        tableView.reloadData()
    }

    func present(alert: CharacterDetailsMVPViewAlert) {
        let vc = UIAlertController(title: alert.title, message: alert.message, preferredStyle: .alert)
        vc.addAction(.init(title: alert.buttonTitle, style: .default, handler: nil))
        present(vc, animated: true, completion: nil)
    }

}
