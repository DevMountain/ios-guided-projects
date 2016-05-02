//
//  LoginSignupViewController.swift
//  PlaylistFirebase
//
//  Created by James Pacheco on 5/1/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButonTapped(sender: AnyObject) {
        UserController.authUser(emailTextField.text ?? "", password: passwordTextField.text ?? "") { (user) in
            if let _ = user {
                self.performSegueWithIdentifier("toListView", sender: nil)
            } else {
                self.presentInvalidLoginAlert()
            }
        }
    }
    
    @IBAction func signupButtonTapped(sender: AnyObject) {
        UserController.createUser(usernameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "") { (user) in
            if let _ = user {
                self.performSegueWithIdentifier("toListView", sender: nil)
            } else {
                self.presentInvalidCreationAlert()
            }
        }
    }
    
    func presentInvalidLoginAlert() {
        let alert = UIAlertController(title: "Invalid Login", message: "Please try logging in again", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Okay", style: .Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func presentInvalidCreationAlert() {
        let alert = UIAlertController(title: "Invalid User Creation", message: "Please try a different email, password, or username", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Okay", style: .Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
}
