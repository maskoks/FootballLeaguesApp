//
//  SeasonsViewController.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class SeasonsViewController: UIViewController {

    private var presenter: SeasonsPresenterLogic?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
    }

    // MARK: - Public methods
    func setPresenter(_ presenter: SeasonsPresenterLogic) {
        self.presenter = presenter
    }
}

// MARK: - Configure UI
private extension SeasonsViewController {
    func configureUI() {

    }
}


// MARK: - Display Logic
extension SeasonsViewController: SeasonsDisplayLogic {
    func display() {

    }
}
