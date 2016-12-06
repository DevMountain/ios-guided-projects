//
//  ViewController.swift
//  PowerNapTimer
//
//  Created by James Pacheco on 4/12/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TimerDelegate {

    fileprivate let localNotificationTag = "timerNotification"
	
	// MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        resetTimer()
        timer.delegate = self
    }
	
	// MARK: Public Methods
	
	// MARK: Actions

    @IBAction func startButtonTapped(_ sender: AnyObject) {
        if timer.isOn {
            timer.stopTimer()
            cancelLocalNotification()
        } else {
            timer.startTimer(0.2*60.0)
            scheduleLocalNotification()
        }
        updateViews()
    }
	
	// MARK: Private Methods
	
	private func updateTimerLabel() {
		timerLabel.text = timer.timeAsString
	}
	
	private func updateViews() {
		updateTimerLabel()

		// If timer is running, start button title should say "Cancel". If timer is not running, title should say "Start nap"
		let title = timer.isOn ? "Cancel" : "Start Nap"
		startButton.setTitle(title, for: UIControlState())
	}
	
	// Reset timer when view loads using local notification fire date if there is one -
	private func resetTimer() {
		guard let localNotifications = UIApplication.shared.scheduledLocalNotifications else { return }
		let timerLocalNotifications = localNotifications.filter({$0.category == localNotificationTag})
		guard let timerNotification = timerLocalNotifications.last,
			let fireDate = timerNotification.fireDate else { return }
		for notification in timerLocalNotifications {
			UIApplication.shared.cancelLocalNotification(notification)
		}
		timer.stopTimer()
		timer.startTimer(fireDate.timeIntervalSinceNow)
	}

	// MARK: TimerDelegate
	
    func timerDidTick() {
        updateTimerLabel()
    }
	
	func timerDidComplete() {
		updateViews()
		var snoozeTextField: UITextField?
		let alert = UIAlertController(title: "Wake up!", message: "Get up ya lazy bum!", preferredStyle: .alert)
		alert.addTextField { (textField) in
			textField.placeholder = "Sleep a few more minutes..."
			textField.keyboardType = .numberPad
			snoozeTextField = textField
		}
		let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel) { (_) in
			self.updateViews()
		}
		let snoozeAction = UIAlertAction(title: "Snooze", style: .default) { (_) in
			guard let timeText = snoozeTextField?.text,
				let time = TimeInterval(timeText) else { return }
			self.timer.startTimer(time*60)
			self.scheduleLocalNotification()
			self.updateViews()
		}
		alert.addAction(dismissAction)
		alert.addAction(snoozeAction)
		present(alert, animated: true, completion: nil)
	}
	
    func timerDidStop() {
        updateViews()
        cancelLocalNotification()
    }
	
	// MARK: Local Notifications
	
    private func scheduleLocalNotification() {
        guard let timerTime = timer.timeRemaining else { return }
        let localNotification = UILocalNotification()
        localNotification.category = localNotificationTag
        localNotification.alertBody = "It's time to wake up"
        localNotification.alertTitle = "Time's up!"
        localNotification.fireDate = Date(timeIntervalSinceNow:timerTime)
        UIApplication.shared.scheduleLocalNotification(localNotification)
    }
    
    private func cancelLocalNotification() {
        guard let localNotifications = UIApplication.shared.scheduledLocalNotifications else { return }
        let timerLocalNotifications = localNotifications.filter({$0.category == localNotificationTag})
        for notification in timerLocalNotifications {
            UIApplication.shared.cancelLocalNotification(notification)
        }
    }
	
	// MARK: - Properties
	
	let timer = Timer()

	@IBOutlet weak var timerLabel: UILabel!
	@IBOutlet weak var startButton: UIButton!
}

