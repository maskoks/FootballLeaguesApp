//
//  LeagueResponse.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

struct LeagueResponse: Decodable {
    let status: Bool
    let data: [League]
}

struct League: Decodable {
    let id: String
    let name: String
    let slug: String
    let abbr: String
    let logos: Logos
}

struct Logos: Decodable {
    let light: String
    let dark: String
}
