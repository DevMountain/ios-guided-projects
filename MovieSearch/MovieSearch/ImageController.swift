//
//  ImageController.swift
//  MovieSearch
//
//  Created by James Pacheco on 4/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ImageController {
    
    static func imageForURL(url: String, completion: (image: UIImage?)->Void) {
        NetworkController.dataAtURL(url) { (data) in
            guard let data = data else {completion(image: nil); return}
            dispatch_async(dispatch_get_main_queue(), { 
                completion(image: UIImage(data: data))
            })
        }
    }
    
}