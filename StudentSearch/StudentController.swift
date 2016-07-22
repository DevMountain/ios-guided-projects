//
//  StudentController.swift
//  StudentSearch
//
//  Created by Michael Mecham on 7/18/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class StudentController {
    
    static var students = ["Patrick", "Jeff", "Tim", "Brad", "Joseph", "Chad", "Chris", "Ryan", "Mitch", "Travis", "Michael", "Diego", "Spencer"]
    
    static func searchForStudentWithName(name: String) -> [String] {
        return students.filter {$0.lowercaseString.containsString(name)}
    }

}