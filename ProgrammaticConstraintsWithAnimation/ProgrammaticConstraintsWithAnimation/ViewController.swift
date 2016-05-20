//
//  ViewController.swift
//  ProgrammaticConstraintsWithAnimation
//
//  Created by Nathan on 4/19/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Buttons
    let topLeftButton = UIButton()
    let topRightButton = UIButton()
    let bottomLeftButton = UIButton()
    let bottomRightButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calling methods that setup the buttons
        setupButtons()
        setupConstraints()
    }
    
    func setupButtons() {
        // Set colors
        topLeftButton.backgroundColor = .greenColor()
        topRightButton.backgroundColor = .yellowColor()
        bottomLeftButton.backgroundColor = .blueColor()
        bottomRightButton.backgroundColor = .redColor()
        
        // Add targets to buttons for color animation
        topLeftButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        topRightButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        bottomLeftButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        bottomRightButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        
        // Add targets to buttons for shake animation
        topLeftButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), forControlEvents: .TouchDragExit)
        topRightButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), forControlEvents: .TouchDragExit)
        bottomLeftButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), forControlEvents: .TouchDragExit)
        bottomRightButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), forControlEvents: .TouchDragExit)
        
        // Add buttons as a subview of the view
        view.addSubview(topLeftButton)
        view.addSubview(topRightButton)
        view.addSubview(bottomLeftButton)
        view.addSubview(bottomRightButton)
    }
    
    // Method for when buttons are tapped
    func buttonTapped() {
        // Make a variable for each color
        let topLeftColor = topLeftButton.backgroundColor
        let topRightColor = topRightButton.backgroundColor
        let bottomLeftColor = bottomLeftButton.backgroundColor
        let bottomRightColor = bottomRightButton.backgroundColor
        
        // Animate the buttons background colors
        UIView.animateWithDuration(1.0) {
            self.topLeftButton.backgroundColor = bottomLeftColor
            self.topRightButton.backgroundColor = topLeftColor
            self.bottomRightButton.backgroundColor = topRightColor
            self.bottomLeftButton.backgroundColor = bottomRightColor
        }
    }
    
    func buttonExited(sender: UIButton) {
        view.bringSubviewToFront(sender)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [sender.frame.origin.x + sender.frame.width/2, sender.frame.origin.x + sender.frame.width/2 - 15, sender.frame.origin.x + sender.frame.width/2, sender.frame.origin.x + sender.frame.width/2 + 15, sender.frame.origin.x + sender.frame.width/2]
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.duration = 0.5
        animation.repeatCount = 5.0
        sender.layer.addAnimation(animation, forKey: "shake")
    }
    
    // Constratints for all of the buttons
    func setupConstraints() {
        // Turn off translatesAutoresizingMaskIntoConstraints
        topLeftButton.translatesAutoresizingMaskIntoConstraints = false
        topRightButton.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftButton.translatesAutoresizingMaskIntoConstraints = false
        bottomRightButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Height and widths constraints
        let topButtonWidths = NSLayoutConstraint(item: topLeftButton, attribute: .Width, relatedBy: .Equal, toItem: topRightButton, attribute: .Width, multiplier: 1.0, constant: 0)
        let leftButtonHeights = NSLayoutConstraint(item: topLeftButton, attribute: .Height, relatedBy: .Equal, toItem: topRightButton, attribute: .Height, multiplier: 1.0, constant: 0)
        let bottomButtonWidths = NSLayoutConstraint(item: bottomLeftButton, attribute: .Width, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Width, multiplier: 1.0, constant: 0)
        let rightbuttonHeights = NSLayoutConstraint(item: bottomRightButton, attribute: .Height, relatedBy: .Equal, toItem: topRightButton, attribute: .Height, multiplier: 1.0, constant: 0)
        
        // Add height and with constraints to view
        view.addConstraints([topButtonWidths, leftButtonHeights, bottomButtonWidths,rightbuttonHeights])
        
        // Green top and leading contraints
        let greenLeadingConstraints = NSLayoutConstraint(item: topLeftButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let greenTopConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
        
        // Green trailing to yellow leading constraint
        let greenToYellowConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .Trailing, relatedBy: .Equal, toItem: topRightButton, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        // Green bottom to blue top constraint
        let greenToBlueConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .Bottom, relatedBy: .Equal, toItem: bottomLeftButton, attribute: .Top, multiplier: 1.0, constant: 0)
        
        // Yellow top and trailing constraints
        let yellowTopConstraint = NSLayoutConstraint(item: topRightButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
        let yellowTrailingConstraint = NSLayoutConstraint(item: topRightButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        // Blue leading and bottom constraints
        let blueLeadingConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let blueBottomConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        // Blue trailing to red leading constraint
        let blueToRedConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .Trailing, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        // Yellow bottom to red top constraint
        let yellowToRedConstraint = NSLayoutConstraint(item: topRightButton, attribute: .Bottom, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Top, multiplier: 1.0, constant: 0)
        
        // Red bottom and trailing constraints
        let redBottomConstraint = NSLayoutConstraint(item: bottomRightButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let redTrailingConstraint = NSLayoutConstraint(item: bottomRightButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        // Add constraints to view
        view.addConstraints([greenLeadingConstraints, greenTopConstraint,greenToYellowConstraint, greenToBlueConstraint, yellowTopConstraint, yellowTrailingConstraint, blueLeadingConstraint, blueBottomConstraint, blueToRedConstraint, yellowToRedConstraint, redBottomConstraint, redTrailingConstraint])
    }
    
}

