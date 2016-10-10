//
//  SurveyController.swift
//  MyAPIDesign
//
//  Created by Michael Mecham on 7/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class SurveyController {
	
	static let baseURL = URL(string: "https://mykeapidesign-a7954.firebaseio.com/api/v1")
	static let getterEndpoint = baseURL?.appendingPathExtension("json")
	
	static func putSurveyIntoAPI(name: String, response: String) {
		let survey = Survey(name: name, response: response)
		guard let url = survey.endpoint else { return }
		NetworkController.performRequest(for: url, httpMethod: .Put, body: survey.jsonData) { (data, error) in
			let responseDataString = String(data: data!, encoding: .utf8) ?? ""
			if error != nil {
				print("Error: \(error?.localizedDescription)")
			} else if responseDataString.contains("error") {
				print("Error: \(responseDataString)")
			} else {
				print("Successfully saved data to endpoint. \nResponse: \(responseDataString)")
			}
		}
	}
	
	static func fetchResponses(completion: @escaping (_ responses: [Survey]) -> Void) {
		guard let url = getterEndpoint else {
			completion([])
			return
		}
		NetworkController.performRequest(for: url, httpMethod: .Get) { (data, error) in
			let responseDataString = String(data: data!, encoding: .utf8) ?? ""
			if error != nil {
				print("Error: \(error?.localizedDescription)")
				completion([])
				return
			} else if responseDataString.contains("error") {
				print("Error: \(responseDataString)")
				completion([])
				return
			}
			guard let data = data,
				let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:[String:AnyObject]] else {
					completion([])
					return
			}
			let surveys = jsonDictionary.flatMap { Survey(dictionary: $0.1 ,identifier: $0.0) }
			completion(surveys)
			surveys.forEach { print($0.response) }
		}
	}
	
}













