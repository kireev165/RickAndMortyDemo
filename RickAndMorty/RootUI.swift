import UIKit


final class RootUI: UINavigationController {

    init() {
        super.init(rootViewController: CharactersListUI())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
