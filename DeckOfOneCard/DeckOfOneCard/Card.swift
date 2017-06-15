//
//  Card.swift
//  DeckOfOneCard
//
//  Created by James Pacheco on 4/18/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

struct Card {
    
    let imageEndpoint: String
    let value: String
    let suit: String
}

extension Card {
    
    private static var suitKey: String { return "suit" }
    private static var valueKey: String { return "value" }
    private static var imageKey: String { return "image" }
    
    init?(dictionary: [String: Any]) {
        guard let imageEndpoint = dictionary[Card.imageKey] as? String,
            let value = dictionary[Card.valueKey] as? String,
            let suit = dictionary[Card.suitKey] as? String else { return nil }
        
        self.imageEndpoint = imageEndpoint
        self.value = value
        self.suit = suit
    }
    
}
