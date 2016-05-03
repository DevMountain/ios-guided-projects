//
//  DetailViewController.swift
//  TableViewMiniLesson
//
//  Created by Jake Herrmann on 10/11/15.
//  Copyright © 2015 Jake Herrmann. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var titleString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleString
    }
    
}
