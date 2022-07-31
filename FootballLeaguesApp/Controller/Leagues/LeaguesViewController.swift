//
//  LeaguesViewController.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class LeaguesViewController: BaseViewController {

    // MARK: - Private properties
    private var presenter: LeaguesPresenterLogic?
    private var data: [League] = []

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
    func setPresenter(_ presenter: LeaguesPresenterLogic) {
        self.presenter = presenter
    }
}

// MARK: - Configure UI
private extension LeaguesViewController {
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
private extension LeaguesViewController {
    func setup() {
        hideNavigationBar()
        setupTableView()
        setupRefreshControl()
    }

    func setupTableView() {
        tableView.register(LeagueCell.self, forCellReuseIdentifier: "LeagueCell")

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
extension LeaguesViewController: LeaguesDisplayLogic {
    func display(_ model: [League]) {
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
}

extension LeaguesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as? LeagueCell ?? UITableViewCell()
        cell.separatorInset = UIEdgeInsets.zero
        if let leagueCell = cell as? LeagueCell {
            leagueCell.model = LeagueCellModel(league: data[indexPath.row])
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = SeasonsModel(leagueID: data[indexPath.row].id)
        let seasonsViewController = SeasonsAssembly.build(model)
        self.navigationController?.pushViewController(seasonsViewController, animated: true)
    }
}
