//
//  LeaguesPresenter.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

final class LeaguesPresenter {
    weak var view: LeaguesDisplayLogic?

    init(view: LeaguesDisplayLogic?) {
        self.view = view
    }
}

private extension LeaguesPresenter {
    // do some request logic here
}

extension LeaguesPresenter: LeaguesPresenterLogic {
    func onViewDidLoad() {
        // do some stuff here
    }

    func onViewWillAppear() {
        // do some stuff here
    }
}
