//
//  NetworkClient.swift
//  AddressBook
//
//  Created by Andrew R Madsen on 3/7/18.
//  Copyright © 2018 DevMountain. All rights reserved.
//

import Foundation

enum NetworkClientError : Int {
	static let domain = "com.DevMountain.AddressBook.NetworkClientErrorDomain"
	
	case noData = 1
	case unexpectedDataType
}

class NetworkClient {
	
	static let baseURL = URL(string: "https://dm-addressbook.firebaseio.com/")!

	func fetchContacts(modifiedAfter date: Date? = nil, completion: @escaping ([String : [String : Any]], Error?) -> Void) {
		
		var url = NetworkClient.baseURL
		url.appendPathComponent("contacts.json")
		var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
		
		if let date = date {
			urlComponents.queryItems = [URLQueryItem(name: "orderBy", value: "\"modificationDate\""),
							  URLQueryItem(name: "startAt", value: String(date.timeIntervalSinceReferenceDate))]
		}
		
		url = urlComponents.url!
		
		URLSession.shared.dataTask(with: url) { (data, _, error) in
			if let error = error {
				completion([:], error)
				return
			}
			
			guard let data = data else {
				let error = NSError(domain: NetworkClientError.domain, code: NetworkClientError.noData.rawValue, userInfo: nil)
				completion([:], error)
				return
			}
			
			do {
				guard let contactDictionaries = try JSONSerialization.jsonObject(with: data, options: []) as? [String : [String : Any]] else {
					throw NSError(domain: NetworkClientError.domain, code: NetworkClientError.unexpectedDataType.rawValue, userInfo: nil)
				}
				
				completion(contactDictionaries, nil)
			} catch {
				completion([:], error)
			}
		}.resume()
	}
	
	func uploadContacts(contacts: [String : [String : Any]], completion: @escaping (Error?) -> Void) {
		var url = NetworkClient.baseURL
		url.appendPathComponent("contacts.json")
		var request = URLRequest(url: url)
		request.httpMethod = "PUT"
		
		do {
			request.httpBody = try JSONSerialization.data(withJSONObject: contacts, options: [])
		} catch {
			completion(error)
			return
		}
		
		URLSession.shared.dataTask(with: request) { (data, _, error) in
			completion(error)
		}.resume()
	}
}
