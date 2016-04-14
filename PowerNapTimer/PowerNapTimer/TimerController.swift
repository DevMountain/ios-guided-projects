//
//  TimerController.swift
//  PowerNapTimer
//
//  Created by James Pacheco on 4/12/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class TimerController: NSObject {
    
    static let sharedInstance = TimerController()
    
    var timer = Timer()
    var localNotification: UILocalNotification?
    
    func startTimer() {
        // Check if timer is on. If not, then set time to 20 minutes and start countdown
        if timer.isOn == false {
            timer.endDate = NSDate(timeIntervalSinceNow: 20*60)
            secondTick()
            scheduleLocalNotification()
        }
    }
    
    func stopTimer() {
        // Check if it is on. If it is, then remove timer's end date and stop countdown
        if timer.isOn {
            timer.endDate = nil
            performSelector(#selector(TimerController.cancelLocalNotification), withObject: nil, afterDelay: 0.5)
        }
    }
    
    func secondTick() {
        // Check to see if timeRemaining > 0. If so, send NSNotification to UI to updateLabel. Otherwise, stopTimer.
        if timer.timeRemaining > 0 {
            performSelector(#selector(TimerController.secondTick), withObject: nil, afterDelay: 1)
            NSNotificationCenter.defaultCenter().postNotificationName("secondTick", object: nil)
        } else {
            NSNotificationCenter.defaultCenter().postNotificationName("timerCompleted", object: nil)
            stopTimer()
        }
    }
    
    func scheduleLocalNotification() {
        // Create local notification with same fire date as the timer
        localNotification = UILocalNotification()
        localNotification?.alertBody = "It's time to wake up"
        localNotification?.alertTitle = "Time's up!"
        localNotification?.fireDate = timer.endDate
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification ?? UILocalNotification())
    }
    
    func cancelLocalNotification() {
        UIApplication.sharedApplication().cancelLocalNotification(localNotification ?? UILocalNotification())
    }
    
    func timeAsString() -> String {
        // return a string representing time remaining
        let timeRemaining = Int(timer.timeRemaining)
        let minutesLeft = timeRemaining / 60
        let secondsLeft = timeRemaining - (minutesLeft*60)
        return String(format: "%02d : %02d", arguments: [minutesLeft, secondsLeft])
    }
}







