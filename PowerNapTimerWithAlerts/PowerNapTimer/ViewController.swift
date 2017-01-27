//
//  ViewController.swift
//  PowerNapTimer
//
//  Created by James Pacheco on 4/12/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, TimerDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    let myTimer = MyTimer()
    fileprivate let userNotificationIdentifier = "timerNotification"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTimer.delegate = self
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetTimer()
    }
    
    func setView() {
        updateTimerLabel()
        // If timer is running, start button title should say "Cancel". If timer is not running, title should say "Start nap"
        if myTimer.isOn {
            startButton.setTitle("Cancel", for: UIControlState())
        } else {
            startButton.setTitle("Start nap", for: UIControlState())
        }
    }
    
    func updateTimerLabel() {
        timerLabel.text = myTimer.timeAsString()
    }
    
    // Reset timer when view loads using local notification fire date if there is one -
    func resetTimer() {
        
        UNUserNotificationCenter.current().getPendingNotificationRequests { (requests) in
            let timerLocalNotifications = requests.filter { $0.identifier == self.userNotificationIdentifier }
            guard let timerNotificationRequest = timerLocalNotifications.last,
                let trigger = timerNotificationRequest.trigger as? UNCalendarNotificationTrigger,
                let fireDate = trigger.nextTriggerDate() else { return }
            
            self.myTimer.stopTimer()
            self.myTimer.startTimer(fireDate.timeIntervalSinceNow)
        }        
    }
    
    // MARK: Actions
    
    @IBAction func startButtonTapped(_ sender: Any) {
        if myTimer.isOn {
            myTimer.stopTimer()
            cancelLocalNotification()
        } else {
            myTimer.startTimer(5)
            scheduleLocalNotification()
        }
        setView()
    }
    
    // MARK: TimerDelegate
    
    func timerSecondTick() {
        updateTimerLabel()
    }
    
    func timerStopped() {
        setView()
        cancelLocalNotification()
        myTimer.timer?.invalidate()
    }
    
    func timerCompleted() {
        setView()
        setUpAlertController()
    }
    
    // MARK: AlertController
    
    func setUpAlertController() {
        var snoozeTextField: UITextField?
        let alert = UIAlertController(title: "Wake up!", message: "Get up ya lazy bum!", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Sleep a few more minutes..."
            textField.keyboardType = .numberPad
            snoozeTextField = textField
        }
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel) { (_) in
            self.setView()
        }
        let snoozeAction = UIAlertAction(title: "Snooze", style: .default) { (_) in
            guard let timeText = snoozeTextField?.text,
                let time = TimeInterval(timeText) else {return}
            self.myTimer.startTimer(time*60)
            self.scheduleLocalNotification()
            self.setView()
        }
        alert.addAction(dismissAction)
        alert.addAction(snoozeAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: UserNotifications
    
    func scheduleLocalNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Wake up!"
        notificationContent.body = "Time to get up"
        
        guard let timeRemaining = myTimer.timeRemaining else { return }
        let fireDate = Date(timeInterval: timeRemaining, since: Date())
        let dateComponents = Calendar.current.dateComponents([.minute, .second], from: fireDate)
        let dateTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: userNotificationIdentifier, content: notificationContent, trigger: dateTrigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Unable to add notification request. \(error.localizedDescription)")
            }
        }
    }
    
    func cancelLocalNotification() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [userNotificationIdentifier])
    }
    
}

