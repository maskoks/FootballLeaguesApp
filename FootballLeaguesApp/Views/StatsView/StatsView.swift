//
//  StatsView.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 31.07.2022.
//

import UIKit

final class StatsView: UIView {

    var model: Model? {
        didSet {
            configureUI()
        }
    }

    private let titleLabel = UILabel()
    private let valueLabel = UILabel()


    private let button = UIButton()

    private func configureUI() {
        setupAppearance()

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(valueLabel)
        valueLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 2.0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

    private func setupAppearance() {
        guard let model = model else { return }
        valueLabel.attributedText = TextHelper.configureBold(text: model.value, color: .label, fontSize: 20.0)
        titleLabel.attributedText = TextHelper.configure(text: model.title, color: .secondaryLabel, fontSize: 14.0)

        valueLabel.textAlignment = .center
        titleLabel.textAlignment = .center
    }
}
