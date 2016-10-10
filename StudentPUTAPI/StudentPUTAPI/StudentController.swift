//
//  StudentController.swift
//  StudentPOSTAPI
//
//  Created by Michael Mecham on 7/13/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class StudentController {
    
    static let baseURL = URL(string: "https://names-e4301.firebaseio.com/students")!
    static let getterEndpoint = baseURL.appendingPathExtension("json")
    
	static func send(studentWithName name: String, completion: ((_ success: Bool) -> Void)? = nil) {
		
		let student = Student(name: name)
        let url = baseURL.appendingPathComponent(name).appendingPathExtension("json")
		
		NetworkController.performRequest(for: url, httpMethod: .Put, body: student.jsonData) { (data, error) in
			var success = false
			defer { completion?(success) }
			
			guard let responseDataString = String(data: data!, encoding: .utf8) else { return }
			
            if error != nil {
                print("Error: \(error!)")
            } else if responseDataString.contains("error") {
                print("Error: \(responseDataString)")
            } else {
                print("Successfully saved data to endpoint. \nResponse: \(responseDataString)")
				success = true
            }
        }
    }
    
    static func fetchStudents(completion: @escaping ([Student]) -> Void) {

		NetworkController.performRequest(for: getterEndpoint, httpMethod: .Get) { (data, error) in
			guard let data = data else { completion([]); return }
			guard let studentsDict = (try? JSONSerialization.jsonObject(with: data, options: [.allowFragments])) as? [String: [String : String]] else {
				completion([])
				return
			}
			let students = studentsDict.flatMap { Student(dictionary: $0.1) }
			completion(students)
        }
    }
}
