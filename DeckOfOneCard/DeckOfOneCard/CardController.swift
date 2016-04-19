//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by James Pacheco on 4/18/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class CardController {
    
    static func drawCard(completion: ((card: Card?) -> Void)) {
        let url = "http://deckofcardsapi.com/api/deck/new/draw/?count=1"
        NetworkController.dataAtURL(url) { (success, data) in
            guard let data = data,
                json = NetworkController.serializeDataAsJson(data),
                cardArray = json["cards"] as? [[String: AnyObject]],
                cardDictionary = cardArray.first
                where success else {
                    completion(card: nil)
                    return
            }
            
            let card = Card(dictionary: cardDictionary)
            completion(card: card)
        }
    }
    
}