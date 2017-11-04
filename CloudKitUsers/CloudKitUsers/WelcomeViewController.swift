//
//  WelcomeViewController.swift
//  CloudKitUsers
//
//  Created by Spencer Curtis on 8/8/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let currentUser = UserController.shared.currentUser else { return }
        
        welcomeLabel.text = "Welcome, \(currentUser.username)!"
    }

}
