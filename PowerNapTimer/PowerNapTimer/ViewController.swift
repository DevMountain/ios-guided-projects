//
//  ViewController.swift
//  PowerNapTimer
//
//  Created by James Pacheco on 4/12/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    let timer = Timer()
    private let localNotificationTag = "timerNotification"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.timerSecondTick), name: "secondTick", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.timerCompleted), name: "timerCompleted", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.setView), name: "timerStopped", object: nil)
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
    
    @IBAction func startButtonTapped(sender: AnyObject) {
        if timer.isOn {
            timer.stopTimer()
        } else {
            timer.startTimer(20*60.0)
        }
        setView()
    }
    
    func timerSecondTick() {
        updateTimerLabel()
    }
    
    func timerCompleted() {
        setView()
    }
}

