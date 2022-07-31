//
//  SeasonsViewController.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class SeasonsViewController: BaseViewController {

    private var presenter: SeasonsPresenterLogic?
    private var data: [Season] = []

    // MARK: - UI
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()

    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        configureUI()
        presenter?.onViewDidLoad()
    }

    // MARK: - Public methods
    func setPresenter(_ presenter: SeasonsPresenterLogic) {
        self.presenter = presenter
    }
}

// MARK: - Configure UI
private extension SeasonsViewController {
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
private extension SeasonsViewController {
    func setup() {
        showNavigationBar()
        navigationItem.title = "Select season"

        setupTableView()
        setupRefreshControl()
    }

    func setupTableView() {
        tableView.register(SeasonCell.self, forCellReuseIdentifier: "SeasonCell")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
    }

    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshFeedData(_:)), for: .valueChanged)
    }

    @objc private func refreshFeedData(_ sender: Any) {
        presenter?.handlePullToRefresh()
    }
}

// MARK: - Display Logic
extension SeasonsViewController: SeasonsDisplayLogic {
    func display(_ model: [Season]) {
        DispatchQueue.main.async {
            if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
        }
        data = model
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func goToStats(_ model: StatsModel) {
        let statsViewController = StatsAssembly.build(model)
        self.navigationController?.pushViewController(statsViewController, animated: true)
    }
}

extension SeasonsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonCell", for: indexPath) as? SeasonCell ?? UITableViewCell()
        cell.separatorInset = UIEdgeInsets.zero
        if let seasonCell = cell as? SeasonCell {
            seasonCell.model = SeasonCellModel(season: data[indexPath.row])
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.handleSelectRow(selectedSeason: data[indexPath.row])
    }
}
