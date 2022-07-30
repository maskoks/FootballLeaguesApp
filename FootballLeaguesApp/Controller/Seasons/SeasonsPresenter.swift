//
//  SeasonsPresenter.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

final class SeasonsPresenter {
    private weak var view: SeasonsDisplayLogic?
    private let model: SeasonsModel

    private let networkManager: NetworkManager

    init(view: SeasonsDisplayLogic?, model: SeasonsModel) {
        self.view = view
        self.model = model
        self.networkManager = NetworkManager.shared
    }
}

private extension SeasonsPresenter {
    func fetchSeasons() {
        NetworkManager.shared.getSeasons(leagueID: model.leagueID) { [weak self] response, error in
            if let response = response {
                print(response.data)
                self?.view?.display(response.data.seasons)
            }
        }
    }
}

extension SeasonsPresenter: SeasonsPresenterLogic {
    func onViewDidLoad() {
        fetchSeasons()
    }

    func handlePullToRefresh() {
        fetchSeasons()
    }
}
