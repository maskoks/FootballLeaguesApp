//
//  NetworkManagerConstants.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

struct NetworkManagerConstants {
    enum ApiCase: String {
        case leagues
        case seasons
        case standings
    }

    enum ApiOption: String {
        case season
        case sort
    }

    static let apiURL = "https://api-football-standings.azharimm.site"

    static func apiLeaguesURL() -> String {
        return "\(apiURL)/\(ApiCase.leagues)"
    }

    static func apiSeasonsURL(leagueID: String) -> String {
        return "\(apiURL)/\(ApiCase.leagues)/\(leagueID)/\(ApiCase.seasons)"
    }

    static func apiStandingsURL(leagueID: String, year: Int, isAscending: Bool) -> String {
        let sortOption = isAscending ? "asc" : "desc"
        return "\(apiURL)/\(leagueID)/\(ApiCase.standings)?\(ApiOption.season)=\(year)&\(ApiOption.sort)=\(sortOption)"
    }
}
