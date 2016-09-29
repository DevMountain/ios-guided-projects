//
//  SignupViewController.swift
//  ViewsAndStoryboards
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signupSegue" {
            let welcomeVC = segue.destination as? WelcomeViewController
            welcomeVC?.email = emailTextField.text
        }
    }
    
	// MARK: - Properties
	
	@IBOutlet weak var emailTextField: UITextField!
}
