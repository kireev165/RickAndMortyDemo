import UIKit

import UIKitReusable


final class CharacterDetailsUITitledValueCell: UITableViewCell, UIReusable {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(title: String, value: String) {
        textLabel?.text = title
        detailTextLabel?.text = value
    }

}
