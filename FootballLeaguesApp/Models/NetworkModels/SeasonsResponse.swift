//
//  SeasonsResponse.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

struct SeasonsResponse: Decodable {
    let status: Bool
    let data: LeagueSeasons
}

struct LeagueSeasons: Decodable {
    let name: String
    let desc: String
    let abbreviation: String
    let seasons: [Season]
}

struct Season: Decodable {
    let year: Int
    let startDate: String
    let endDate: String
    let displayName: String
    let types: [SeasonTypes]
}

struct SeasonTypes: Decodable {
    let id: String
    let name: String
    let abbreviation: String
    let startDate: String
    let endDate: String
    let hasStandings: Bool
}
