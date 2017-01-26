//
//  ViewController.swift
//  ProgrammaticConstraintsWithAnimation
//
//  Created by Nathan on 4/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
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
        topLeftButton.backgroundColor = .green
        topRightButton.backgroundColor = .yellow
        bottomLeftButton.backgroundColor = .blue
        bottomRightButton.backgroundColor = .red
        
        // Add targets to buttons for color animation
        topLeftButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        topRightButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        bottomLeftButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        bottomRightButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Add targets to buttons for shake animation
        topLeftButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), for: .touchDragExit)
        topRightButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), for: .touchDragExit)
        bottomLeftButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), for: .touchDragExit)
        bottomRightButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), for: .touchDragExit)
        
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
        UIView.animate(withDuration: 1.0, animations: {
            self.topLeftButton.backgroundColor = bottomLeftColor
            self.topRightButton.backgroundColor = topLeftColor
            self.bottomRightButton.backgroundColor = topRightColor
            self.bottomLeftButton.backgroundColor = bottomRightColor
        }) 
    }
    
    func buttonExited(_ sender: UIButton) {
        view.bringSubview(toFront: sender)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [sender.frame.origin.x + sender.frame.width/2, sender.frame.origin.x + sender.frame.width/2 - 15, sender.frame.origin.x + sender.frame.width/2, sender.frame.origin.x + sender.frame.width/2 + 15, sender.frame.origin.x + sender.frame.width/2]
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.duration = 0.5
        animation.repeatCount = 5.0
        sender.layer.add(animation, forKey: "shake")
    }
    
    // Constratints for all of the buttons
    func setupConstraints() {
        // Turn off translatesAutoresizingMaskIntoConstraints
        topLeftButton.translatesAutoresizingMaskIntoConstraints = false
        topRightButton.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftButton.translatesAutoresizingMaskIntoConstraints = false
        bottomRightButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Height and widths constraints
        let topButtonWidths = NSLayoutConstraint(item: topLeftButton, attribute: .width, relatedBy: .equal, toItem: topRightButton, attribute: .width, multiplier: 1.0, constant: 0)
        let leftButtonHeights = NSLayoutConstraint(item: topLeftButton, attribute: .height, relatedBy: .equal, toItem: topRightButton, attribute: .height, multiplier: 1.0, constant: 0)
        let bottomButtonWidths = NSLayoutConstraint(item: bottomLeftButton, attribute: .width, relatedBy: .equal, toItem: bottomRightButton, attribute: .width, multiplier: 1.0, constant: 0)
        let rightbuttonHeights = NSLayoutConstraint(item: bottomRightButton, attribute: .height, relatedBy: .equal, toItem: topRightButton, attribute: .height, multiplier: 1.0, constant: 0)
        
        // Add height and with constraints to view
        view.addConstraints([topButtonWidths, leftButtonHeights, bottomButtonWidths,rightbuttonHeights])
        
        // Green top and leading contraints
        let greenLeadingConstraints = NSLayoutConstraint(item: topLeftButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
        let greenTopConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        
        // Green trailing to yellow leading constraint
        let greenToYellowConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .trailing, relatedBy: .equal, toItem: topRightButton, attribute: .leading, multiplier: 1.0, constant: 0)
        
        // Green bottom to blue top constraint
        let greenToBlueConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .bottom, relatedBy: .equal, toItem: bottomLeftButton, attribute: .top, multiplier: 1.0, constant: 0)
        
        // Yellow top and trailing constraints
        let yellowTopConstraint = NSLayoutConstraint(item: topRightButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        let yellowTrailingConstraint = NSLayoutConstraint(item: topRightButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
        
        // Blue leading and bottom constraints
        let blueLeadingConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
        let blueBottomConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        // Blue trailing to red leading constraint
        let blueToRedConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .trailing, relatedBy: .equal, toItem: bottomRightButton, attribute: .leading, multiplier: 1.0, constant: 0)
        
        // Yellow bottom to red top constraint
        let yellowToRedConstraint = NSLayoutConstraint(item: topRightButton, attribute: .bottom, relatedBy: .equal, toItem: bottomRightButton, attribute: .top, multiplier: 1.0, constant: 0)
        
        // Red bottom and trailing constraints
        let redBottomConstraint = NSLayoutConstraint(item: bottomRightButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let redTrailingConstraint = NSLayoutConstraint(item: bottomRightButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
        
        // Add constraints to view
        view.addConstraints([greenLeadingConstraints, greenTopConstraint,greenToYellowConstraint, greenToBlueConstraint, yellowTopConstraint, yellowTrailingConstraint, blueLeadingConstraint, blueBottomConstraint, blueToRedConstraint, yellowToRedConstraint, redBottomConstraint, redTrailingConstraint])
    }
    
}

