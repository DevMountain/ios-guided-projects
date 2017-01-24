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
	
	static func draw(numberOfCards: Int, completion: @escaping ((_ card: [Card]) -> Void)) {
		guard let url = self.baseURL else { fatalError("URL optional is nil") }
		
		let urlParameters = ["count": "\(numberOfCards)"]
		
		NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
			
			guard let data = data,
				let responseDataString = String(data: data, encoding: .utf8) else {
					NSLog("No data returned from network request")
					completion([])
					return
			}
			guard let responseDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any],
				let cardDictionaries = responseDictionary["cards"] as? [[String: Any]] else {
					NSLog("Unable to serialize JSON. \nResponse: \(responseDataString)")
					completion([])
					return
			}
			
			let cards = cardDictionaries.flatMap { Card(dictionary: $0) }
			completion(cards)
		}
		
	}
}
