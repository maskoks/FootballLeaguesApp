//
//  SeasonsPresenterLogic.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

protocol SeasonsPresenterLogic: AnyObject {
    func onViewDidLoad()
    func handlePullToRefresh()
    func handleSelectRow(selectedSeason: Season)
}
