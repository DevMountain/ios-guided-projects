//
//  StudentController.swift
//  StudentPOSTAPI
//
//  Created by Michael Mecham on 7/13/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class StudentController {
    
    static let baseURL = NSURL(string: "https://names-e4301.firebaseio.com/students")!
    static let getterEndpoint = baseURL.URLByAppendingPathExtension("json")
    
	static func sendStudent(name: String, completion: ((success: Bool) -> Void)? = nil) {
		
		let student = Student(name: name)
        let url = baseURL.URLByAppendingPathComponent(name).URLByAppendingPathExtension("json")
        
        NetworkController.performRequestForURL(url, httpMethod: .Put, body: student.jsonData) { (data, error) in
			var success = false
			defer { completion?(success: success) }
			
			guard let responseDataString = NSString(data: data!, encoding: NSUTF8StringEncoding) else { return }
			
            if error != nil {
                print("Error: \(error!)")
            } else if responseDataString.containsString("error") {
                print("Error: \(responseDataString)")
            } else {
                print("Successfully saved data to endpoint. \nResponse: \(responseDataString)")
				success = true
            }
        }
    }
    
    static func fetchStudents(completion: (students: [Student]) -> Void) {

		NetworkController.performRequestForURL(getterEndpoint, httpMethod: .Get) { (data, error) in
			guard let data = data else { completion(students: []); return }
			guard let studentsDict = (try? NSJSONSerialization.JSONObjectWithData(data, options: [.AllowFragments])) as? [String: [String : String]] else {
				completion(students: [])
				return
			}
			let students = studentsDict.flatMap { Student(dictionary: $0.1) }
			completion(students: students)
        }
    }
}
