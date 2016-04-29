//
//  RestaurantController.swift
//  FirebaseRestaurantList
//
//  Created by James Pacheco on 4/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import Firebase

class RestaurantController {
    
    static let sharedInstance = RestaurantController()
    
    var restaurants: [Restaurant]
    
    init() {
        self.restaurants = []
        self.observeRestaurants { (restaurants) in
            self.restaurants = restaurants
            NSNotificationCenter.defaultCenter().postNotificationName("restaurantsUpdated", object: nil)
        }
    }
    
    func addRestaurant(name: String, category: String) {
        let restaurant = Restaurant(name: name, category: category)
        addRestaurantToFirebase(restaurant)
    }
    
    func deleteRestaurant(restaurant: Restaurant) {
        if let index = restaurants.indexOf(restaurant) {
            restaurants.removeAtIndex(index)
            restaurant.delete()
        }
    }
    
    private func addRestaurantToFirebase(restaurant: Restaurant) {
        var restaurant = restaurant
        restaurant.save()
    }
    
    private func observeRestaurants(completion: (restaurants: [Restaurant])->Void) {
        FirebaseController.base.childByAppendingPath("Restaurants").observeEventType(.Value, withBlock: { (snapshot) in
            guard let dataDictionary = snapshot.value as? [String: [String:AnyObject]] else {completion(restaurants: []); return}
            let restaurants = dataDictionary.flatMap {Restaurant(dictionary: $1, identifier: $0)}
            completion(restaurants: restaurants)
        })
    }
    
}