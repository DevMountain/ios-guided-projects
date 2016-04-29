//
//  Restaurant.swift
//  FirebaseRestaurantList
//
//  Created by James Pacheco on 4/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Restaurant: Equatable, FirebaseType {
    let name: String
    let category: String
    var identifier: String?
    var endpoint: String {
        return "Restaurants"
    }
    
    var jsonValue: [String : AnyObject] {
        return ["name": name, "category": category]
    }
    
    init(name: String, category: String) {
        self.name = name
        self.category = category
    }
    
    required init?(dictionary: [String : AnyObject], identifier: String) {
        guard let name = dictionary["name"] as? String,
            category = dictionary["category"] as? String else {return nil}
        self.name = name
        self.category = category
        self.identifier = identifier
    }

}

func ==(lhs: Restaurant, rhs: Restaurant) -> Bool {
    return lhs.identifier == rhs.identifier
}