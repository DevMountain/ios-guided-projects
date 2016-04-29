//
//  RestaurantController.swift
//  FirebaseRestaurantList
//
//  Created by James Pacheco on 4/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RestaurantController {
    
    static let sharedInstance = RestaurantController()
    
    var restaurants: [Restaurant]
    
    init() {
        self.restaurants = []
    }
    
    func addRestaurant(name: String, category: String) {
        let restaurant = Restaurant(name: name, category: category)
        self.restaurants.append(restaurant)
    }
    
    func deleteRestaurant(restaurant: Restaurant) {
        if let index = restaurants.indexOf(restaurant) {
            restaurants.removeAtIndex(index)
        }
    }
    
}