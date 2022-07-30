//
//  StatsAssembly.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class StatsAssembly {
    static func build() -> UIViewController {
        let controller = StatsViewController()

        let presenter = StatsPresenter(view: controller)
        controller.setPresenter(presenter)

        return controller
    }
}
