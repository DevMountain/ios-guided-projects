//
//  SurveyController.swift
//  MyAPIDesign
//
//  Created by Michael Mecham on 7/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class SurveyController {
    
    // NOTE TO MENTOR: Replace this baseURL with your own so you can show the students the Firebase Database as you do network calls
    
	static let baseURL = URL(string: "https://survey-6a54e.firebaseio.com/")
    
    static var surveys: [Survey] = []
	
    static func putSurveyIntoAPI(name: String, response: String) {
		let survey = Survey(name: name, response: response)
        
        guard let url = SurveyController.baseURL?.appendingPathComponent(survey.identifier).appendingPathExtension("json") else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        request.httpBody = survey.jsonData
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            guard let data = data, let responseDataString = String(data: data, encoding: .utf8) else {
                print("No data returned from data task")
                return
            }
            
            if let error = error {
				print("Error: \(error)")
			} else if responseDataString.contains("error") {
				print("Error: \(responseDataString)")
			} else {
				print("Successfully saved data to endpoint. \nResponse: \(responseDataString)")
			}
		}
        
        dataTask.resume()
	}
	
	static func fetchResponses(completion: @escaping () -> Void) {
        
        guard let url = baseURL?.appendingPathExtension("json") else { completion(); return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion()
                return
            }
            
            guard let data = data, let responseDataString = String(data: data, encoding: .utf8) else {
                print("No data returned from data task")
                completion()
                return
            }
            
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: [String: Any]] else {
                print("Could not serialize json \nResponse: \(responseDataString)")
                completion()
                return
            }
            
            let surveys = jsonDictionary.compactMap { Survey(dictionary: $0.1 ,identifier: $0.0) }
            
            self.surveys = surveys
            
			completion()
		}
        
        dataTask.resume()
	}
	
}
