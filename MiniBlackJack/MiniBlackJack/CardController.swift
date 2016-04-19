//
//  CardController.swift
//  MiniBlackJack
//
//  Created by James Pacheco on 4/19/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class CardController {
    
    private static let url = "http://deckofcardsapi.com/api/deck/new/draw/?count="
    
    static func drawCards(numberOfCards: Int, completion: (cards: [Card]) -> Void) {
        let url = self.url + String(numberOfCards)
        NetworkController.dataAtURL(url) { (data) in
            guard let data = data,
                json = NetworkController.jsonWithReturn(data),
                cardArray = json["cards"] as? [[String: AnyObject]] else {completion(cards: []); return}
            let cards = cardArray.flatMap{Card(dictionary: $0)}
            completion(cards: cards)
        }
    }
    
    
}