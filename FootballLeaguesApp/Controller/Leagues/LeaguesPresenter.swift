//
//  LeaguesPresenter.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

final class LeaguesPresenter {
    weak var view: LeaguesDisplayLogic?

    let networkManager: NetworkManager

    init(view: LeaguesDisplayLogic?) {
        self.view = view
        self.networkManager = NetworkManager.shared
    }
}

private extension LeaguesPresenter {
    func fetchLeagues() {
        NetworkManager.shared.getLeagues { [weak self] response, error in
            if let response = response {
                self?.view?.display(response.data)
            }
            if let error = error {
                print(error)
            }
        }
    }
}

extension LeaguesPresenter: LeaguesPresenterLogic {
    func handlePullToRefresh() {
        fetchLeagues()
    }

    func onViewDidLoad() {
        fetchLeagues()
    }
}
