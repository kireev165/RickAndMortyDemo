import UIKit

import UIKitReusable
import UIKitConstraints
import Nuke
import SwiftBackwardArrow


final class CharacterDetailsUIImageCell: UITableViewCell, UIReusable {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(url: URL) {
        Nuke.loadImage(with: url, into: pictureView)
    }


    // MARK: - private

    @CustomConstraints
    private var pictureView: UIImageView = .init() <- {
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }

    private func setupViewHierarchy() {
        contentView.addSubview(pictureView)
    }

    private func setupConstraints() {
        let cell = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate {
            pictureView.widthAnchor == pictureView.heightAnchor ~ .init(rawValue: 999)

            cell.leadingAnchor == pictureView.leadingAnchor
            cell.topAnchor == pictureView.topAnchor
            cell.trailingAnchor == pictureView.trailingAnchor
            cell.bottomAnchor == pictureView.bottomAnchor
        }
    }

}
