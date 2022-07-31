//
//  DateHelper.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation

struct DateHelper {
    static func dateFromJSON(date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mmZ"
        return dateFormatter.date(from: date)
    }

    static func configureSeasonDates(from startDate: Date, to endDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return "\(dateFormatter.string(from: startDate)) to \(dateFormatter.string(from: endDate))"
    }

    static func configureSeasonYears(from startDate: Date, to endDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return "\(dateFormatter.string(from: startDate))/\(dateFormatter.string(from: endDate))"
    }

    static func configureSeasonShortYears(from startDate: Date, to endDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return "\(dateFormatter.string(from: startDate))/\(dateFormatter.string(from: endDate))"
    }
}
