//
//  LeagueCell.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class LeagueCell: UITableViewCell {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private let abbrLabel = UILabel()

    private let logo = UIImageView()

    var model: LeagueCellModel? {
        didSet {
            configureUI()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        logo.image = nil
    }

    private func configureUI() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        abbrLabel.translatesAutoresizingMaskIntoConstraints = false
        logo.translatesAutoresizingMaskIntoConstraints = false

        setup()

        contentView.addSubview(logo)
        logo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15.0).isActive = true
        logo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        logo.widthAnchor.constraint(equalTo: logo.heightAnchor).isActive = true

        contentView.addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 20.0).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true

        contentView.addSubview(abbrLabel)
        abbrLabel.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 20.0).isActive = true
        abbrLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        abbrLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0).isActive = true
        abbrLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.0).isActive = true
    }

    private func setup() {
        guard let model = model else { return }
        nameLabel.attributedText = TextHelper.configure(text: model.league.name, color: UIColor.label, fontSize: 16.0)
        abbrLabel.attributedText = TextHelper.configure(text: model.league.abbr, color: UIColor.secondaryLabel, fontSize: 11.0)
        logo.setImage(from: model.league.logos.light)
    }
}
