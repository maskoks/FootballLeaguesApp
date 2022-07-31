//
//  SeasonPicker+Model.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 31.07.2022.
//

import Foundation

extension SeasonPicker {
    struct Model {
        let pickerData: [Season]
        var selectedSeason: Season
        var doneCallbackAction: ((Season) -> Void)?
        var cancelCallbackAction: (() -> Void)?
    }
}
