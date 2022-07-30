//
//  NetworkService.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()

    func getLeagues(completion: @escaping (LeagueResponse?, Error?) -> Void) {
        guard let url = URL(string: NetworkManagerConstants.apiLeaguesURL()) else {
            completion(nil, NSError(domain: "Invalid URL", code: 1))
            return
        }
        request(url: url, completion: completion)
//        let session = URLSession.shared
//        let request = URLRequest(url: url)
//        let task = session.dataTask(with: request) { data, response, error in
//            guard error == nil else {
//                return
//            }
//            guard let data = data else {
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(LeagueResponse.self, from: data)
//                print(response)
//                completion(response, error)
//
//            } catch {
//                print(error)
//                completion(nil, error)
//            }
//        }
//        task.resume()
    }

    func getSeasons(leagueID: String, completion: @escaping (SeasonsResponse?, Error?) -> Void) {
        guard let url = URL(string: NetworkManagerConstants.apiSeasonsURL(leagueID: leagueID)) else {
            completion(nil, NSError(domain: "Invalid URL", code: 1))
            return
        }
        request(url: url, completion: completion)
//        let session = URLSession.shared
//        let request = URLRequest(url: url)
//        let task = session.dataTask(with: request) { data, response, error in
//            guard error == nil else {
//                return
//            }
//            guard let data = data else {
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(SeasonsResponse.self, from: data)
//                print(response)
//                completion(response, error)
//
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
    }

    func getStandings(leagueID: String, season: Int, isAscending: Bool, completion: @escaping (StandingsResponse?, Error?) -> Void) {
        guard let url = URL(string: NetworkManagerConstants.apiStandingsURL(leagueID: leagueID, year: season, isAscending: isAscending)) else {
            completion(nil, NSError(domain: "Invalid URL", code: 1))
            return
        }
        request(url: url, completion: completion)
//        let session = URLSession.shared
//        let request = URLRequest(url: url)
//        let task = session.dataTask(with: request) { data, response, error in
//            guard error == nil else {
//                return
//            }
//            guard let data = data else {
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode(StandingsResponse.self, from: data)
//                print(response)
//                completion(response, error)
//
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
    }

    private func request<T: Decodable>(url: URL, completion: @escaping (T?, Error?) -> Void) {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(T.self, from: data)
                print(response)
                completion(response, error)

            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
