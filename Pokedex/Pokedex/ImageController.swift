//
//  ImageController.swift
//  Pokedex
//
//  Created by Nicholas Laughter on 1/3/17.
//  Copyright © 2017 Nicholas Laughter. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func getImage(atURL urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else { fatalError("Not a real URL") }
        NetworkController.performRequest(for: url, httpMethod: .get) { (data, error) in
            if let error = error {
                fatalError("Error performing network request: \(error.localizedDescription)")
            }
            guard let data = data,
                let image = UIImage(data: data) else {
                    DispatchQueue.main.async { completion(nil) }
                    return
            }
            DispatchQueue.main.async { completion(image) }
        }
    }
}
