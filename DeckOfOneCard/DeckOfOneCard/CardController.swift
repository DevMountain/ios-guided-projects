//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by James Pacheco on 4/18/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class CardController {
    
    static let baseURL = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/")
    
    static func drawCards(numberOfCards: Int, completion: ((card: [Card]) -> Void)) {
        guard let url = self.baseURL else {fatalError("URL optional is nil")}
        
        let urlParameters = ["count": "\(numberOfCards)"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            
            if let data = data,
                responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding) {
                guard let responseDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject],
                cardDictionaries = responseDictionary["cards"] as? [[String: AnyObject]] else {
                    print("Unable to serialize JSON. \nResponse: \(responseDataString)")
                    completion(card: [])
                    return
                }
                let cards = cardDictionaries.flatMap {Card(dictionary: $0)}
                completion(card: cards)
            } else {
                print("No data returned from network request")
                completion(card: [])
            }
        }
        
    }
}