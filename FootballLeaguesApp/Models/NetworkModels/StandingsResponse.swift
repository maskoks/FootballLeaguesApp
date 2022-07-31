//
//  StandingsResponse.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

struct StandingsResponse: Decodable {
    let status: Bool
    let data: LeagueStandings
}

struct LeagueStandings: Decodable {
    let name: String
    let abbreviation: String
    let seasonDisplay: String
    let season: Int
    let standings: [Standing]
}

struct Standing: Decodable {
    let team: Team
    let note: Note?
    let stats: [Stats]
}

struct Team: Decodable {
    let id: String
    let uid: String
    let location: String
    let name: String
    let abbreviation: String
    let displayName: String
    let shortDisplayName: String
    let isActive: Bool
    let logos: [TeamLogos]?
}

struct Note: Decodable {
    let color: String
    let description: String
    let rank: Int
}

struct Stats: Decodable {
    let name: String
    let displayName: String
    let shortDisplayName: String
    let description: String
    let abbreviation: String
    let type: String
    let value: Int?
    let displayValue: String
}

struct TeamLogos: Decodable {
    let href: String
    let width: Int
    let height: Int
    let alt: String
    let rel: [String]
    let lastUpdated: String
}
