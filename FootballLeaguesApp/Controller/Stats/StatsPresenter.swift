//
//  StatsPresenter.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

final class StatsPresenter {
    weak var view: StatsDisplayLogic?

    init(view: StatsDisplayLogic?) {
        self.view = view
    }
}

private extension StatsPresenter {
    // do some request logic here
}

extension StatsPresenter: StatsPresenterLogic {
    func onViewDidLoad() {
        // do some stuff here
    }

    func onViewWillAppear() {
        // do some stuff here
    }
}
