//
//  SeasonsAssembly.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

final class SeasonsAssembly {
    static func build() -> UIViewController {
        let controller = SeasonsViewController()

        let presenter = SeasonsPresenter(view: controller)
        controller.setPresenter(presenter)

        return controller
    }
}
