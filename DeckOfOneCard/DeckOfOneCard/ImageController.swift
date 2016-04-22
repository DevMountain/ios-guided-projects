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
        NetworkController.dataAtURL(url) { (success, data) in
            guard let data = data where success else {
                completion(image: nil)
                return
            }
            dispatch_async(dispatch_get_main_queue(), {
                completion(image: UIImage(data: data))
            })
        }
    }
}