//
//  ImageController.swift
//  DeckOfOneCard
//
//  Created by James Pacheco on 4/18/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func imageForURL(_ url: String, completion: @escaping ((_ image: UIImage?) -> Void)) {
        guard let url = URL(string: url) else {fatalError("Image URL optional is nil")}
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            DispatchQueue.main.async(execute: {
                completion(UIImage(data: data))
            })
        }
    }
}
