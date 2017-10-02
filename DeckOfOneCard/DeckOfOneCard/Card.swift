//
//  Card.swift
//  DeckOfOneCard
//
//  Created by James Pacheco on 4/18/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

struct Card: Codable {
	enum CodingKeys: String, CodingKey {
		case imageEndpoint = "image"
		case value = "value"
		case suit = "suit"
	}
    
    let imageEndpoint: String
    let value: String
    let suit: String
}

struct CardList: Codable {
	let cards: [Card]
}
