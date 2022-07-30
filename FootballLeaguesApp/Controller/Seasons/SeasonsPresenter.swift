//
//  SeasonsPresenter.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

final class SeasonsPresenter {
    weak var view: SeasonsDisplayLogic?

    init(view: SeasonsDisplayLogic?) {
        self.view = view
    }
}

private extension SeasonsPresenter {
    // do some request logic here
}

extension SeasonsPresenter: SeasonsPresenterLogic {
    func onViewDidLoad() {
        // do some stuff here
    }

    func onViewWillAppear() {
        // do some stuff here
    }
}
