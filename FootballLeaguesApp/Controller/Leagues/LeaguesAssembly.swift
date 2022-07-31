//
//  LeaguesAssembly.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class LeaguesAssembly {
    static func build() -> UIViewController {
        let controller = LeaguesViewController()
        let presenter = LeaguesPresenter(view: controller)
        controller.setPresenter(presenter)
        return controller
    }
}
