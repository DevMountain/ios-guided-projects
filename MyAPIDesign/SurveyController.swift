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
    
}