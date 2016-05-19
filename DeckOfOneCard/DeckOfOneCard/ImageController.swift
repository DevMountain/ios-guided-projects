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
    
    static func imageForURL(url: String, completion: ((image: UIImage?) -> Void)) {
        guard let url = NSURL(string: url) else {fatalError("Image URL optional is nil")}
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data else {
                completion(image: nil)
                return
            }
            dispatch_async(dispatch_get_main_queue(), {
                completion(image: UIImage(data: data))
            })
        }
    }
}