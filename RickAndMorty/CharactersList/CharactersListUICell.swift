import UIKit

import SwiftBackwardArrow
import UIKitConstraints
import UIKitReusable
import Nuke


final class CharactersListUICell: UITableViewCell, UIReusable {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(model: CharactersListMVPViewCell) {
        nameLabel.text = model.name
        raceTitleLabel.text = model.raceTitle
        raceValueLabel.text = model.raceValue
        genderTitleLabel.text = model.genderTitle
        genderValueLabel.text = model.genderValue
        Nuke.loadImage(with: model.avatar, into: avatar)
    }


    // MARK: - private

    @CustomConstraints
    private var nameLabel: UILabel = .init() <- {
        $0.font = .preferredFont(forTextStyle: .title2)
        $0.textAlignment = .center
    }

    @CustomConstraints
    private var raceStack: UIStackView = .init()

    @CustomConstraints
    private var raceTitleLabel: UILabel = .init() <- {
        $0.font = .preferredFont(forTextStyle: .headline)
    }

    @CustomConstraints
    private var raceValueLabel: UILabel = .init()

    @CustomConstraints
    private var genderStack: UIStackView = .init()

    @CustomConstraints
    private var genderTitleLabel: UILabel = .init() <- {
        $0.font = .preferredFont(forTextStyle: .headline)
    }

    @CustomConstraints
    private var genderValueLabel: UILabel = .init()

    @CustomConstraints
    private var avatar: UIImageView = .init() <- {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }

    private func setupViewHierarchy() {
        contentView.addSubview(avatar)
        contentView.addSubview(nameLabel)

        contentView.addSubview(raceStack)
        raceStack.addArrangedSubview(raceTitleLabel)
        raceStack.addArrangedSubview(raceValueLabel)

        contentView.addSubview(genderStack)
        genderStack.addArrangedSubview(genderTitleLabel)
        genderStack.addArrangedSubview(genderValueLabel)
    }

    private func setupConstraints() {
        let cell = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate {
            avatar.heightAnchor == avatar.widthAnchor

            cell.leadingAnchor == avatar.leadingAnchor
            cell.topAnchor == avatar.topAnchor
            cell.trailingAnchor == avatar.trailingAnchor

            cell.leadingAnchor == nameLabel.leadingAnchor
            avatar.bottomAnchor == nameLabel.topAnchor
            cell.trailingAnchor == nameLabel.trailingAnchor

            cell.leadingAnchor == raceStack.leadingAnchor
            nameLabel.bottomAnchor == raceStack.topAnchor
            cell.trailingAnchor == raceStack.trailingAnchor

            cell.leadingAnchor == genderStack.leadingAnchor
            raceStack.bottomAnchor == genderStack.topAnchor
            cell.trailingAnchor == genderStack.trailingAnchor

            cell.bottomAnchor == genderStack.bottomAnchor
        }
    }

}
