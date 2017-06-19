//
//  UserViewController.swift
//  CloudKitUsers
//
//  Created by Spencer Curtis on 3/23/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateViews), name: UserController.shared.currentUserWasSetNotification, object: nil)
    }
    
    @IBAction func saveUserButtonTapped(_ sender: Any) {
        
        guard let username = usernameTextField.text, let email = emailTextField.text, let age = ageTextField.text else { return }
        
        
        if UserController.shared.currentUser == nil {
            
            // Create new user
            UserController.shared.createUser(username: username, email: email, age: age, completion: { (user) in
                
               self.updateViews()
                
            })
        } else {
            
            // Update existing current user
            UserController.shared.updateCurrentUser(username: username, email: email, age: age, completion: { (user) in
                self.updateViews()
            })
        }
    }
    
    func updateViews() {
        guard let currentUser = UserController.shared.currentUser else { return }
        
        DispatchQueue.main.async {
            self.usernameLabel.text = currentUser.username
            self.emailLabel.text = currentUser.email
            self.ageLabel.text = currentUser.age
        }
    }
    
    @IBAction func loadUserButtonTapped(_ sender: Any) {
        
    }
    
    
    
    
}




