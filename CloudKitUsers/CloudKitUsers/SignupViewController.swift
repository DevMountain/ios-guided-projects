//
//  SignupViewController.swift
//  CloudKitUsers
//
//  Created by Spencer Curtis on 8/8/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(segueToWelcomeVC), name: UserController.shared.currentUserWasSetNotification, object: nil)
    }
    
    @objc func segueToWelcomeVC() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "toWelcomeVC", sender: self)
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        guard let email = emailTextField.text,
            let username = usernameTextField.text else { return }
        
        activityIndicator.startAnimating()
        
        UserController.shared.createUserWith(username: username, email: email) { (success) in
            
            self.activityIndicator.stopAnimating()
            
            if !success {
                DispatchQueue.main.async {
                    self.presentSimpleAlert(title: "Unable to create an account", message: "Make sure you have a network connection, and please try again.")
                    self.activityIndicator.stopAnimating()
                }
                return
            }
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        
        guard UserController.shared.currentUser == nil else { segueToWelcomeVC(); return }
        
        activityIndicator.startAnimating()
        
        UserController.shared.fetchCurrentUser { (success) in
            
            if !success {
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    
                    self.presentSimpleAlert(title: "No iCloud account configured", message: "Please sign into iCloud in your device's settings and try again.")
                }
                return
            }
        }
    }
    
    func presentSimpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(dismissAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
