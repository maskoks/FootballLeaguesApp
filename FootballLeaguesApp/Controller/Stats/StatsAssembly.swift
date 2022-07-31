//
//  StatsAssembly.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class StatsAssembly {
    static func build(_ model: StatsModel) -> UIViewController {
        let controller = StatsViewController()
        let presenter = StatsPresenter(view: controller, model: model)
        controller.setPresenter(presenter)
        return controller
    }
}
