//
//  ImageCache.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 31.07.2022.
//

import UIKit

final class ImageCache {

    static let shared = ImageCache()

    private let cache = NSCache<NSString, UIImage>()

    func imageFor(url: URL, completionHandler: @escaping (_ image: UIImage?, _ error: Error?) -> Void) {
        DispatchQueue.global().async { [weak self] in
            if let imageInCache = self?.cache.object(forKey: url.absoluteString as NSString)  {
                completionHandler(imageInCache, nil)
                return
            }
        }

        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            let session = URLSession.shared
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { data, response, error in

                if let error = error {
                    completionHandler(nil, error)
                    return
                }

                let image = UIImage(data: data!)

                self.cache.setObject(image!, forKey: url.absoluteString as NSString)
                completionHandler(image, nil)
            }
            task.resume()
        }
    }
}


