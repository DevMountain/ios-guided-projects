//
//  ViewController.swift
//  PowerNapTimer
//
//  Created by James Pacheco on 4/12/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNSNotificationObserver()
        setView()
    }
    
    func setView() {
        updateTimerLabel()
        // If timer is running, start button title should say "Cancel". If timer is not running, title should say "Start nap"
        if TimerController.sharedInstance.timer.isOn {
            startButton.setTitle("Cancel", forState: .Normal)
        } else {
            startButton.setTitle("Start nap", forState: .Normal)
        }
    }
    
    func addNSNotificationObserver() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.updateTimerLabel), name: "secondTick", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.presentTimerCompletedAlert), name: "timerCompleted", object: nil)
    }

    @IBAction func startButtonTapped(sender: AnyObject) {
        if TimerController.sharedInstance.timer.isOn {
            TimerController.sharedInstance.stopTimer()
        } else {
            TimerController.sharedInstance.startTimer()
        }
        setView()
    }
    
    func updateTimerLabel() {
        timerLabel.text = TimerController.sharedInstance.timeAsString()
    }
    
    func presentTimerCompletedAlert() {
        let alert = UIAlertController(title: "Wake up!", message: "Get up ya lazy bum!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Dismiss", style: .Cancel) { (_) in
            self.setView()
        }
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }

}

