//
//  SurveyViewController.swift
//  MyAPIDesign
//
//  Created by Michael Mecham on 7/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var responseTextField: UITextField!
    
    @IBAction func submitButtonTapped(sender: AnyObject) {
        guard let name = nameTextField.text,
        response = responseTextField.text where name.characters.count > 0 && response.characters.count > 0 else {
            return
        }
        SurveyController.putSurveyIntoAPI(name, response: response)
        nameTextField.text = ""
        responseTextField.text = ""
    }
}
