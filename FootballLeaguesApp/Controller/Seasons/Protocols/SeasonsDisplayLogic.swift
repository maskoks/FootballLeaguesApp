//
//  SeasonsDisplayLogic.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

protocol SeasonsDisplayLogic: AnyObject {
    func display(_ model: [Season])
    func goToStats(_ model: StatsModel)
}

