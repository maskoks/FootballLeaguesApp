//
//  StatsViewController.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class StatsViewController: UIViewController {

    private var presenter: StatsPresenterLogic?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }

    // MARK: - Public methods
    func setPresenter(_ presenter: StatsPresenterLogic) {
        self.presenter = presenter
    }
}

// MARK: - Configure UI
private extension StatsViewController {
    func configureUI() {

    }
}


// MARK: - Display Logic
extension StatsViewController: StatsDisplayLogic {
    func display() {

    }
}
