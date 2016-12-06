//
//  Timer.swift
//  PowerNapTimer
//
//  Created by James Pacheco on 4/12/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class Timer: NSObject {
	
	// MARK: Public Methods
	
    func startTimer(_ time: TimeInterval) {
        if !isOn {
            timeRemaining = time
            perform(#selector(Timer.secondTick), with: nil, afterDelay: 1)
        }
    }
    
    func stopTimer() {
        if isOn {
            timeRemaining = nil
            delegate?.timerDidStop()
        }
    }
	
	// MARK: Private Methods
	
	@objc private func secondTick() {
		guard let timeRemaining = timeRemaining else { return }
		if timeRemaining > 0 {
			self.timeRemaining = timeRemaining - 1
			perform(#selector(Timer.secondTick), with: nil, afterDelay: 1)
			delegate?.timerDidTick()
		} else {
			self.timeRemaining = nil
			delegate?.timerDidComplete()
		}
	}
	
	// MARK: Properties
	
	var timeRemaining: TimeInterval?
	
	weak var delegate: TimerDelegate?
	
	var isOn: Bool {
		return timeRemaining != nil
	}
	
	var timeAsString: String {
		let timeRemaining = Int(self.timeRemaining ?? 20*60)
		let minutesLeft = timeRemaining / 60
		let secondsLeft = timeRemaining - (minutesLeft*60)
		return String(format: "%02d:%02d", arguments: [minutesLeft, secondsLeft])
	}
}

protocol TimerDelegate: class {
    func timerDidTick()
    func timerDidComplete()
    func timerDidStop()
}
