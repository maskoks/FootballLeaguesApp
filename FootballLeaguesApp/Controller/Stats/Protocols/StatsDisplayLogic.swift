//
//  StatsDisplayLogic.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

protocol StatsDisplayLogic: AnyObject {
    func display(_ season: Season)
    func display(_ seasons: [Season])
    func display(_ team: [Standing])
}
