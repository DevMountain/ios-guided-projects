//
//  Restaurant.swift
//  FirebaseRestaurantList
//
//  Created by James Pacheco on 4/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Restaurant: Equatable {
    let name: String
    let category: String
    
    init(name: String, category: String) {
        self.name = name
        self.category = category
    }

}

func ==(lhs: Restaurant, rhs: Restaurant) -> Bool {
    return lhs.name == rhs.name && lhs.category == rhs.category
}