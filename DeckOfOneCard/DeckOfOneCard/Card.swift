//
//  Card.swift
//  DeckOfOneCard
//
//  Created by James Pacheco on 4/18/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class Card {
    
    private let suitKey = "suit"
    private let valueKey = "value"
    private let imageKey = "image"
	
    init(imageEndpoint: String, value: String, suit: String) {
        self.imageEndpoint = imageEndpoint
        self.value = value
        self.suit = suit
    }
    
    init?(dictionary: [String: Any]) {
        guard let imageEndpoint = dictionary[imageKey] as? String,
            let value = dictionary[valueKey] as? String,
            let suit = dictionary[suitKey] as? String else { return nil }
        
        self.imageEndpoint = imageEndpoint
        self.value = value
        self.suit = suit
    }
	
	// MARK: Properties
	
	let imageEndpoint: String
	let value: String
	let suit: String
}
