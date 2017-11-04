//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by James Pacheco on 4/18/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class CardController {
	
	static let baseURL = URL(string: "http://deckofcardsapi.com/api/deck/new/draw/")
	
	static func draw(numberOfCards: Int, completion: @escaping ((_ card: [Card]) -> Void)) {
		guard let url = self.baseURL else { fatalError("URL optional is nil") }
		
		var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
		
		let cardCountQueryItem = URLQueryItem(name: "count", value: "\(numberOfCards)")
		
		components?.queryItems = [cardCountQueryItem]
		
		guard let requestURL = components?.url else { return }
		
		var request = URLRequest(url: requestURL)
		
		request.httpMethod = "GET"
		
		let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
			
			do {
				if let error = error { throw error }
				guard let data = data else { throw NSError() }
				
				let cardList = try JSONDecoder().decode(CardList.self, from: data)
				completion(cardList.cards)
			} catch {
				NSLog("Error retrieving cards from \(requestURL): \(error)")
				completion([])
				return
			}
		}
		
		dataTask.resume()
	}
	
	static func image(forURL url: String, completion: @escaping (UIImage?) -> Void) {
		guard let url = URL(string: url) else { fatalError("Image URL optional is nil") }
		
		let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
			
			guard let data = data,
				let image = UIImage(data: data) else {
					DispatchQueue.main.async { completion(nil) }
					return
			}
			
			DispatchQueue.main.async { completion(image) }
		}
		
		dataTask.resume()
	}
	
	
}
