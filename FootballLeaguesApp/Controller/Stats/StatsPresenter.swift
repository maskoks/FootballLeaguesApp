//
//  StatsPresenter.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class StatsPresenter {
    private weak var view: StatsDisplayLogic?
    private var model: StatsModel
    private let networkManager: NetworkManager

    init(view: StatsDisplayLogic?, model: StatsModel) {
        self.view = view
        self.model = model
        self.networkManager = NetworkManager.shared
    }
}

private extension StatsPresenter {
    func fetchStandings() {
        NetworkManager.shared.getStandings(leagueID: model.leagueID, season: model.selectedSeason.year, isAscending: true) { [weak self] response, error in
            if let response = response {
                print(response)
                self?.view?.display(response.data.standings)
            }
            if let error = error {
                print(error)
            }
        }
    }
}

extension StatsPresenter: StatsPresenterLogic {
    func onViewDidLoad() {
        view?.display(model.selectedSeason)
        view?.display(model.seasons)
        fetchStandings()
    }

    func handlePullToRefresh() {
        fetchStandings()
    }

    func handleSeasonPick(_ season: Season) {
        model.selectedSeason = season
        fetchStandings()
        view?.display(model.selectedSeason)
    }
}
