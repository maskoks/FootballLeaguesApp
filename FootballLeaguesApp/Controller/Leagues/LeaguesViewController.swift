//
//  LeaguesViewController.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class LeaguesViewController: UIViewController {

    private var presenter: LeaguesPresenterLogic?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }

    // MARK: - Public methods
    func setPresenter(_ presenter: LeaguesPresenterLogic) {
        self.presenter = presenter
    }
}

// MARK: - Configure UI
private extension LeaguesViewController {
    func configureUI() {

    }
}


// MARK: - Display Logic
extension LeaguesViewController: LeaguesDisplayLogic {
    func display() {

    }
}


