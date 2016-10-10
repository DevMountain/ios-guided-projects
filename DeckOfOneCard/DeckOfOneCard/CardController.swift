//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by James Pacheco on 4/18/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class CardController {
    
    static let baseURL = URL(string: "http://deckofcardsapi.com/api/deck/new/draw/")
    
    static func drawCards(_ numberOfCards: Int, completion: @escaping ((_ card: [Card]) -> Void)) {
        guard let url = self.baseURL else {fatalError("URL optional is nil")}
        
        let urlParameters = ["count": "\(numberOfCards)"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            
            if let data = data,
                let responseDataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                guard let responseDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: AnyObject],
                let cardDictionaries = responseDictionary["cards"] as? [[String: AnyObject]] else {
                    print("Unable to serialize JSON. \nResponse: \(responseDataString)")
                    completion([])
                    return
                }
                let cards = cardDictionaries.flatMap {Card(dictionary: $0)}
                completion(cards)
            } else {
                print("No data returned from network request")
                completion([])
            }
        }
        
    }
}
