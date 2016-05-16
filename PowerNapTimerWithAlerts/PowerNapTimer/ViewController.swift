//
//  ViewController.swift
//  PowerNapTimer
//
//  Created by James Pacheco on 4/12/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TimerDelegate {

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    let timer = Timer()
    private let localNotificationTag = "timerNotification"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        resetTimer()
        timer.delegate = self
    }
    
    func setView() {
        updateTimerLabel()
        // If timer is running, start button title should say "Cancel". If timer is not running, title should say "Start nap"
        if timer.isOn {
            startButton.setTitle("Cancel", forState: .Normal)
        } else {
            startButton.setTitle("Start nap", forState: .Normal)
        }
    }
    
    func updateTimerLabel() {
        timerLabel.text = timer.timeAsString()
    }
    
    // Reset timer when view loads using local notification fire date if there is one -
    func resetTimer() {
        guard let localNotifications = UIApplication.sharedApplication().scheduledLocalNotifications else {return}
        let timerLocalNotifications = localNotifications.filter({$0.category == localNotificationTag})
        guard let timerNotification = timerLocalNotifications.last,
            fireDate = timerNotification.fireDate else {return}
        for notification in timerLocalNotifications {
            UIApplication.sharedApplication().cancelLocalNotification(notification)
        }
        timer.stopTimer()
        timer.startTimer(fireDate.timeIntervalSinceNow)
        
    }

    @IBAction func startButtonTapped(sender: AnyObject) {
        if timer.isOn {
            timer.stopTimer()
            cancelLocalNotification()
        } else {
            timer.startTimer(0.2*60.0)
            scheduleLocalNotification()
        }
        setView()
    }
    
    func timerSecondTick() {
        updateTimerLabel()
    }
    
    func timerStopped() {
        setView()
        cancelLocalNotification()
    }
    
    func timerCompleted() {
        setView()
        let alert = UIAlertController(title: "Wake up!", message: "Get up ya lazy bum!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Dismiss", style: .Cancel) { (_) in
            self.setView()
        }
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func scheduleLocalNotification() {
        guard let timerTime = timer.timeRemaining else {return}
        let localNotification = UILocalNotification()
        localNotification.category = localNotificationTag
        localNotification.alertBody = "It's time to wake up"
        localNotification.alertTitle = "Time's up!"
        localNotification.fireDate = NSDate(timeIntervalSinceNow:timerTime)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    func cancelLocalNotification() {
        guard let localNotifications = UIApplication.sharedApplication().scheduledLocalNotifications else {return}
        let timerLocalNotifications = localNotifications.filter({$0.category == localNotificationTag})
        for notification in timerLocalNotifications {
            UIApplication.sharedApplication().cancelLocalNotification(notification)
        }
    }

}

