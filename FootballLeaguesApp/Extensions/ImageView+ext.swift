//
//  ImageView+ext.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import UIKit

extension UIImageView {
    func setImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        ImageCache.shared.imageFor(url: url) { [weak self] image, error  in
            if let image = image {
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            }

            if let error = error {
                print(error)
            }
        }
    }
}
