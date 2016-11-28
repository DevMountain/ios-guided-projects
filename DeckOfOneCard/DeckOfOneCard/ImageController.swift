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
    
    static func image(forURL url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else { fatalError("Image URL optional is nil") }
		NetworkController.performRequest(for: url, httpMethod: .Get) { (data, error) in
            guard let data = data,
			let image = UIImage(data: data) else {
				DispatchQueue.main.async { completion(nil) }
                return
            }

			DispatchQueue.main.async { completion(image) }
        }
    }
}
