//
//  SeasonCell.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class SeasonCell: UITableViewCell {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private let descLabel = UILabel()

    var model: SeasonCellModel? {
        didSet {
            configureUI()
        }
    }

    private func configureUI() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.translatesAutoresizingMaskIntoConstraints = false

        setup()

        contentView.addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true

        contentView.addSubview(descLabel)
        descLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0).isActive = true
        descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        descLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0).isActive = true
        descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.0).isActive = true
    }

    private func setup() {
        guard let model = model, let seasonDescription = model.season.types.first else { return }
        nameLabel.attributedText = TextHelper.configure(text: "Season \(seasonDescription.name)", color: UIColor.label, fontSize: 16.0)

        if let startDate = DateHelper.dateFromJSON(date: seasonDescription.startDate),
           let endDate = DateHelper.dateFromJSON(date: seasonDescription.endDate) {
            let descText = DateHelper.configureSeasonDates(from: startDate, to: endDate)
            descLabel.attributedText = TextHelper.configure(text: descText, color: UIColor.secondaryLabel, fontSize: 14.0)
        } else {
            descLabel.attributedText = TextHelper.configure(text: "Sorry, we have no information about dates :(", color: UIColor.secondaryLabel, fontSize: 14.0)
        }
    }

}
