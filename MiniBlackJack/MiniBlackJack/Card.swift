//
//  Card.swift
//  MiniBlackJack
//
//  Created by James Pacheco on 4/19/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class Card {
    
    private let kValue = "value"
    private let kImageEndpoint = "image"
    private let kSuit = "suit"
    
    let value: String
    let suit: String
    let imageEndpoint: String
    var intValue: Int {
        switch value {
        case "KING":
            return 13
        case "QUEEN":
            return 12
        case "JACK":
            return 11
        case "ACE":
            return 14
        default:
            return Int(value)!
        }
    }
    
    init(value: String, suit: String, imageEndpoint: String) {
        self.value = value
        self.suit = suit
        self.imageEndpoint = imageEndpoint
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let value = dictionary[kValue] as? String,
            imageEndpoint = dictionary[kImageEndpoint] as? String,
            suit = dictionary[kSuit] as? String else {return nil}
        
        self.value = value
        self.suit = suit
        self.imageEndpoint = imageEndpoint
    }
    
}