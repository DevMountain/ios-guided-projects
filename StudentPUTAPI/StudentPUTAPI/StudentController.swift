//
//  StudentController.swift
//  StudentPOSTAPI
//
//  Created by Michael Mecham on 7/13/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class StudentController {
    
    static var students: [Student] = []
    
    // NOTE TO MENTOR: Replace this baseURL with your own so you can show the students the Firebase Database as you do network calls
    
    static let baseURL = URL(string: "https://studentputapi-3a581.firebaseio.com/students")
    
	static func putStudentWith(name: String, completion: @escaping (_ success: Bool) -> Void) {
		
		let student = Student(name: name)
        
        guard let url = baseURL?.appendingPathComponent(UUID().uuidString).appendingPathExtension("json") else { completion(false); return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = student.jsonData
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            
			var success = false
            
			defer { completion(success) }
			
			guard let data = data,
                let responseDataString = String(data: data, encoding: .utf8) else { return }
			
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Successfully saved data to endpoint. \nResponse: \(responseDataString)")
                
                self.students.append(student)
                
				success = true
            }
        }
        
        dataTask.resume()
    }
    
    static func fetchStudents(completion: @escaping () -> Void) {
        
        guard let url = baseURL?.appendingPathExtension("json") else { completion(); return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data else {
                print("No data returned from data task")
                completion()
                return
            }
            
			guard let studentsDict = (try? JSONSerialization.jsonObject(with: data, options: [.allowFragments])) as? [String: [String : String]] else {
                print("Unable to serialize JSON")
				completion()
				return
			}
            
			let students = studentsDict.flatMap { Student(dictionary: $0.value) }
            
            self.students = students
            
			completion()
        }
        
        dataTask.resume()
    }
}
