//
//  SurveyController.swift
//  MyAPIDesign
//
//  Created by Michael Mecham on 7/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class SurveyController {
    
    static let baseURL = NSURL(string: "https://mykeapidesign-a7954.firebaseio.com/api/v1")
    static let getterEndpoint = baseURL?.URLByAppendingPathExtension("json")
    
    static func putSurveyIntoAPI(name: String, response: String) {
        let survey = Survey(name: name, response: response)
        guard let url = survey.endpoint else { return }
        NetworkController.performRequestForURL(url, httpMethod: .Put, body: survey.jsonData) { (data, error) in
            let responseDataString = NSString(data: data!, encoding: NSUTF8StringEncoding) ?? ""
            if error != nil {
                print("Error: \(error?.localizedDescription)")
            } else if responseDataString.containsString("error") {
                print("Error: \(responseDataString)")
            } else {
                print("Successfully daved data to endpoint. \nResponse: \(responseDataString)")
            }
        }
    }
    
}