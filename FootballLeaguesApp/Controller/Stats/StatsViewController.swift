//
//  StatsViewController.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class StatsViewController: BaseViewController {

    // MARK: - Private properties
    private var presenter: StatsPresenterLogic?
    private var data: [Standing] = []
    private var pickerData: [Season] = [] //  костыль

    // MARK: - UI
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()

    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()

    private let clickableTitle = NavigationClickableView()

    private var seasonPicker: SeasonPicker?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureUI()
        presenter?.onViewDidLoad()
    }

    // MARK: - Public methods
    func setPresenter(_ presenter: StatsPresenterLogic) {
        self.presenter = presenter
    }

    // MARK: - Private methods
    private func showPicker(model: SeasonPicker.Model) {
        seasonPicker = SeasonPicker(model: model)
        if let seasonPicker = seasonPicker {
            seasonPicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
            self.view.addSubview(seasonPicker)
        }
    }
}

// MARK: - Configure UI
private extension StatsViewController {
    func configureUI() {
        configureContentView()
        configureTableView()
    }

    func configureContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)

        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }

    func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tableView)

        tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor).isActive = true
    }
}

// MARK: - Setup
private extension StatsViewController {
    func setup() {
        showNavigationBar()
        setupTableView()
        setupRefreshControl()
    }

    func setupTableView() {
        tableView.register(StatsCell.self, forCellReuseIdentifier: "StatsCell")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
        tableView.separatorStyle = .none
    }

    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshFeedData(_:)), for: .valueChanged)
    }

    @objc private func refreshFeedData(_ sender: Any) {
        presenter?.handlePullToRefresh()
    }

    func setupClickableTitle(with season: Season) {
        if let startDate = DateHelper.dateFromJSON(date: season.startDate),
           let endDate = DateHelper.dateFromJSON(date: season.endDate) {
            clickableTitle.title = DateHelper.configureSeasonShortYears(from: startDate, to: endDate)
        } else {
            clickableTitle.title = "Select season"
        }
        clickableTitle.callbackAction = { [weak self] in
            guard let self = self else { return }
            let model = SeasonPicker.Model(pickerData: self.pickerData, selectedSeason: season) { [weak self] season in
                self?.handleSeasonPick(season)
            } cancelCallbackAction: { [weak self] in
                self?.seasonPicker?.removeFromSuperview()
            }
            self.showPicker(model: model)
        }
        navigationItem.titleView = clickableTitle
    }

    func handleSeasonPick(_ season: Season) {
        seasonPicker?.removeFromSuperview()
        refreshControl.beginRefreshing()
        data = []
        tableView.reloadData()
        presenter?.handleSeasonPick(season)
    }
}

// MARK: - Display Logic
extension StatsViewController: StatsDisplayLogic {
    func display(_ seasons: [Season]) {
        pickerData = seasons
    }

    func display(_ season: Season) {
        setupClickableTitle(with: season)
    }

    func display(_ teams: [Standing]) {
        DispatchQueue.main.async {
            if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
        }
        data = teams
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - TableView
extension StatsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatsCell", for: indexPath) as? StatsCell ?? UITableViewCell()
        cell.separatorInset = UIEdgeInsets.zero
        if let leagueCell = cell as? StatsCell {
            leagueCell.model = StatsCellModel(standing: data[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
