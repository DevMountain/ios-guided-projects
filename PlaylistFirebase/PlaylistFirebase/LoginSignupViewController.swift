//
//  LoginSignupViewController.swift
//  PlaylistFirebase
//
//  Created by James Pacheco on 5/3/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("toListView", sender: nil)
    }
    
    @IBAction func signupButtonTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("toListView", sender: nil)
    }

}
