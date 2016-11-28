//
//  SurveyViewController.swift
//  MyAPIDesign
//
//  Created by Michael Mecham on 7/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {
	
    @IBAction func submitButtonTapped(_ sender: AnyObject) {
        guard let name = nameTextField.text,
        let response = responseTextField.text,
			!name.isEmpty && !response.isEmpty else {
            return
        }
        SurveyController.putSurveyIntoAPI(name: name, response: response)
        nameTextField.text = ""
        responseTextField.text = ""
    }
	
	// MARK: Properties
	
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var responseTextField: UITextField!
}
