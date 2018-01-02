//
//  Character.swift
//  HarryPotterCodable
//
//  Created by Aaron Martinez on 12/5/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import UIKit

struct Character: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case house
        case patronus
        case imageURL = "image"
    }
    
    let name: String
    let house: String
    let patronus: String
    let imageURL: String
    var image: UIImage? = nil
}
