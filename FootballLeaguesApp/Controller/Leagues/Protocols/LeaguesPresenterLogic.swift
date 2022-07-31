//
//  LeaguesPresenterLogic.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

protocol LeaguesPresenterLogic: AnyObject {
    func onViewDidLoad()
    func handlePullToRefresh()
}
