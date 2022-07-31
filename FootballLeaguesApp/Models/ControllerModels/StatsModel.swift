//
//  StatsModel.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

struct StatsModel {
    let leagueID: String
    let seasons: [Season]
    var selectedSeason: Season
}
