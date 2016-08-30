//
//  TestViewController.swift
//  ViewsAndStoryboards
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.backgroundColor = .blueColor()
        print("The view loaded")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("The view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("The view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        print("The view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("The view did disappear")
    }

	// MARK: - Properties

	@IBOutlet weak var nameLabel: UILabel!
}
