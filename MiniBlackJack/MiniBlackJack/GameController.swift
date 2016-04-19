//
//  GameController.swift
//  MiniBlackJack
//
//  Created by James Pacheco on 4/19/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class GameController {
    
    enum Winner {
        case Player
        case Computer
        case Tie
    }
    
    static func playGame(completion: (winner: Winner, playerCard: Card, computerCard: Card) -> Void) {
        CardController.drawCards(2) { (cards) in
            guard cards.count == 2 else {print("PROBLEM"); return}
            let playerCard = cards[0]
            let computerCard = cards[1]
            if playerCard.intValue > computerCard.intValue {
                completion(winner: Winner.Player, playerCard: playerCard, computerCard: computerCard)
            } else if playerCard.intValue == computerCard.intValue {
                completion(winner: .Tie, playerCard: playerCard, computerCard: computerCard)
            } else {
                completion(winner: .Computer, playerCard: playerCard, computerCard: computerCard)
            }
        }
    }
}