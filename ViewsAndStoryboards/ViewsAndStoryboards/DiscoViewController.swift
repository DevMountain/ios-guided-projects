//
//  DiscoViewController.swift
//  ViewsAndStoryboards
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class DiscoViewController: UIViewController {
	
    @IBAction func discoButonTapped(sender: AnyObject) {
        self.view.backgroundColor = .redColor()
    }
    
    @IBAction func discoButtonTappedOutside(sender: AnyObject) {
        self.view.backgroundColor = .blueColor()
    }
    
    @IBAction func discoButtonTappedEnter(sender: AnyObject) {
        self.view.backgroundColor = .purpleColor()
    }
}
