//
//  StatsCell.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class StatsCell: UITableViewCell {
    //MARK: - UI
    //MARK: Left Stack
    private let leftStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 15.0
        return stack
    }()

    private lazy var rankImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var statusImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: Header View
    private let headerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8.0
        view.backgroundColor = .white.withAlphaComponent(0.25)
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private let rankView = StatsView()
    private let pointsView = StatsView()

    //MARK: Description View
    private let descView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8.0
        view.backgroundColor = .white.withAlphaComponent(0.25)
        return view
    }()

    private let winsView = StatsView()
    private let lossesView = StatsView()
    private let tiesView = StatsView()
    private let goalsDiffView = StatsView()

    //MARK: Background
    let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8.0
        return view
    }()

    let backgrounImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0.15
        return imageView
    }()

    var model: StatsCellModel? {
        didSet {
            configureUI()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        backView.backgroundColor = .systemBackground
        backgrounImageView.image = nil

        backgrounImageView.transform = .identity
        clearStack()
    }

    private func configureUI() {
        setup()

        configureLeftStack()
        configureBackGround()

        configureHeaderView()
        configureDescView()
    }

    private func configureBackGround() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backgrounImageView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(backView)
        backView.leadingAnchor.constraint(equalTo: leftStackView.trailingAnchor, constant: 5.0).isActive = true
        backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 130.0).isActive = true

        backView.addSubview(backgrounImageView)
        backgrounImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: 75.0).isActive = true
        backgrounImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: -75.0).isActive = true
        backgrounImageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: 75.0).isActive = true
        backgrounImageView.widthAnchor.constraint(equalTo: backgrounImageView.heightAnchor).isActive = true
    }

    private func configureLeftStack() {
        leftStackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(leftStackView)
        leftStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5.0).isActive = true
        leftStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0).isActive = true
        leftStackView.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
    }

    private func configureHeaderView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        rankView.translatesAutoresizingMaskIntoConstraints = false
        pointsView.translatesAutoresizingMaskIntoConstraints = false

        backView.addSubview(headerView)
        headerView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10.0).isActive = true
        headerView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10.0).isActive = true
        headerView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10.0).isActive = true

        headerView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10.0).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true

        headerView.addSubview(pointsView)
        pointsView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10.0).isActive = true
        pointsView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 3.0).isActive = true
        pointsView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -3.0).isActive = true

        headerView.addSubview(rankView)
        rankView.trailingAnchor.constraint(equalTo: pointsView.leadingAnchor, constant: -10.0).isActive = true
        rankView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 3.0).isActive = true
        rankView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -3.0).isActive = true
    }

    private func configureDescView() {
        descView.translatesAutoresizingMaskIntoConstraints = false
        winsView.translatesAutoresizingMaskIntoConstraints = false
        tiesView.translatesAutoresizingMaskIntoConstraints = false
        lossesView.translatesAutoresizingMaskIntoConstraints = false
        goalsDiffView.translatesAutoresizingMaskIntoConstraints = false

        backView.addSubview(descView)
        descView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10.0).isActive = true
        descView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10.0).isActive = true
        descView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10.0).isActive = true

        descView.addSubview(winsView)
        winsView.leadingAnchor.constraint(equalTo: descView.leadingAnchor, constant: 10.0).isActive = true
        winsView.topAnchor.constraint(equalTo: descView.topAnchor, constant: 3.0).isActive = true
        winsView.bottomAnchor.constraint(equalTo: descView.bottomAnchor, constant: -3.0).isActive = true

        descView.addSubview(tiesView)
        tiesView.leadingAnchor.constraint(equalTo: winsView.trailingAnchor, constant: 10.0).isActive = true
        tiesView.topAnchor.constraint(equalTo: descView.topAnchor, constant: 3.0).isActive = true
        tiesView.bottomAnchor.constraint(equalTo: descView.bottomAnchor, constant: -3.0).isActive = true

        descView.addSubview(lossesView)
        lossesView.leadingAnchor.constraint(equalTo: tiesView.trailingAnchor, constant: 10.0).isActive = true
        lossesView.topAnchor.constraint(equalTo: descView.topAnchor, constant: 3.0).isActive = true
        lossesView.bottomAnchor.constraint(equalTo: descView.bottomAnchor, constant: -3.0).isActive = true

        descView.addSubview(goalsDiffView)
        goalsDiffView.leadingAnchor.constraint(equalTo: lossesView.trailingAnchor, constant: 10.0).isActive = true
        goalsDiffView.topAnchor.constraint(equalTo: descView.topAnchor, constant: 3.0).isActive = true
        goalsDiffView.bottomAnchor.constraint(equalTo: descView.bottomAnchor, constant: -3.0).isActive = true
        goalsDiffView.trailingAnchor.constraint(equalTo: descView.trailingAnchor, constant: -10.0).isActive = true
    }

    private func setup() {
        guard let model = model else { return }
        let stats = model.standing.stats

        contentView.backgroundColor = .systemGray6

        if let note = model.standing.note {
            let backgroundColor: UIColor = ColorHelper.colorWithHexString(hexString: note.color, alpha: 0.25)
            backView.backgroundColor = backgroundColor
        } else {
            backView.backgroundColor = .systemBackground
        }
        backView.clipsToBounds = true

        backgrounImageView.image = nil
        if let logos = model.standing.team.logos, let logoUrl = logos.first?.href {
            backgrounImageView.setImage(from: logoUrl)
        }

        backgrounImageView.rotate(angle: 25.0)

        setupLeftStack(with: model.standing.note, and: stats)
        setupHeaderView(with: model.standing.team, and: stats)
        setupDescView(with: stats)
    }

    private func setupLeftStack(with note: Note?, and stats: [Stats]) {
        if let rank = stats.first(where: {$0.name == StatsTitle.rank.rawValue}), let rankValue = rank.value {
            var image: UIImage? {
                switch rankValue {
                case 1:
                    return UIImage(named: "gold_logo")
                case 2:
                    return UIImage(named: "silver_logo")
                case 3:
                    return UIImage(named: "bronze_logo")
                default:
                    return nil
                }
            }
            if (1...3).contains(rankValue) {
                rankImageView.image = image
                leftStackView.addArrangedSubview(rankImageView)
                rankImageView.widthAnchor.constraint(equalTo: leftStackView.widthAnchor).isActive = true
                rankImageView.heightAnchor.constraint(equalTo: rankImageView.widthAnchor).isActive = true
            }

        }
        guard let note = note else { return }
        if let noteStatus = NoteStatus(rawValue: note.description) {
            switch noteStatus {
            case .championsLeague, .championsLeagueQualifying:
                statusImageView.image = UIImage(named: "champions_league_logo")
            case .europaLeague, .europaLeagueQualifying:
                statusImageView.image = UIImage(named: "europa_league_logo")
            case .conferenceLeague, .conferenceLeagueQualifyung:
                statusImageView.image = UIImage(named: "conference_league_logo")
            case .relegation:
                statusImageView.image = UIImage(named: "red_arrow")
            }
            leftStackView.addArrangedSubview(statusImageView)
            statusImageView.widthAnchor.constraint(equalTo: leftStackView.widthAnchor).isActive = true
            statusImageView.heightAnchor.constraint(equalTo: statusImageView.widthAnchor).isActive = true
        }
    }

    private func setupHeaderView(with team: Team, and stats: [Stats]) {
        titleLabel.attributedText = TextHelper.configureBold(text: team.shortDisplayName, color: .label, fontSize: 20.0)
        if let rank = stats.first(where: {$0.name == StatsTitle.rank.rawValue}) {
            rankView.model = StatsView.Model(title: rank.displayName, value: rank.displayValue)
        }
        if let points = stats.first(where: {$0.name == StatsTitle.points.rawValue}) {
            pointsView.model = StatsView.Model(title: points.displayName, value: points.displayValue)
        }
    }

    private func setupDescView(with stats: [Stats]) {
        if let wins = stats.first(where: {$0.name == StatsTitle.wins.rawValue}) {
            winsView.model = StatsView.Model(title: wins.displayName, value: wins.displayValue)
        }

        if let ties = stats.first(where: {$0.name == StatsTitle.ties.rawValue}) {
            tiesView.model = StatsView.Model(title: ties.displayName, value: ties.displayValue)
        }

        if let losses = stats.first(where: {$0.name == StatsTitle.losses.rawValue}) {
            lossesView.model = StatsView.Model(title: losses.displayName, value: losses.displayValue)
        }

        if let goalsDiff = stats.first(where: {$0.name == StatsTitle.pointDifferential.rawValue}) {
            goalsDiffView.model = StatsView.Model(title: goalsDiff.shortDisplayName, value: goalsDiff.displayValue)
        }
    }

    private func clearStack() {
        leftStackView.arrangedSubviews.forEach({$0.removeFromSuperview()})
    }
}
