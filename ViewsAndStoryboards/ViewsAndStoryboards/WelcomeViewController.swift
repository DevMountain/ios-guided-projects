//
//  WelcomeViewController.swift
//  ViewsAndStoryboards
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let email = email {
            welcomeLabel.text = "Welcome \(email)!"
        }
    }

	// MARK: - Properties
	
	var email: String?
	
	@IBOutlet weak var welcomeLabel: UILabel!

}
