//
//  Timer.swift
//  PowerNapTimer
//
//  Created by James Pacheco on 4/12/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class Timer: NSObject {
    
    var timeRemaining: NSTimeInterval?
    
    var isOn: Bool {
        if timeRemaining != nil {
            return true
        } else {
            return false
        }
    }
    
    func timeAsString() -> String {
        let timeRemaining = Int(self.timeRemaining ?? 20*60)
        let minutesLeft = timeRemaining / 60
        let secondsLeft = timeRemaining - (minutesLeft*60)
        return String(format: "%02d : %02d", arguments: [minutesLeft, secondsLeft])
    }

    @objc private func secondTick() {
        guard let timeRemaining = timeRemaining else {return}
        if timeRemaining > 0 {
            self.timeRemaining = timeRemaining - 1
            performSelector(#selector(Timer.secondTick), withObject: nil, afterDelay: 1)
            NSNotificationCenter.defaultCenter().postNotificationName("secondTick", object: nil)
        } else {
            self.timeRemaining = nil
            NSNotificationCenter.defaultCenter().postNotificationName("timerCompleted", object: nil)
        }
    }
    
    func startTimer(time: NSTimeInterval) {
        if !isOn {
            timeRemaining = time
            performSelector(#selector(Timer.secondTick), withObject: nil, afterDelay: 1)
        }
    }
    
    func stopTimer() {
        if isOn {
            timeRemaining = nil
            NSNotificationCenter.defaultCenter().postNotificationName("timerStopped", object: nil)
        }
    }
}
