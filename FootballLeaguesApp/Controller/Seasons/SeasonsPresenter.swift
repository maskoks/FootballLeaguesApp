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

    private var data: [Season] = []

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
                guard let self = self else { return }
                print(response.data)
                self.data = response.data.seasons
                self.view?.display(self.data)
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

    func handleSelectRow(selectedSeason: Season) {
        let statsModel = StatsModel(leagueID: model.leagueID, seasons: data, selectedSeason: selectedSeason)
        view?.goToStats(statsModel)
    }
}
