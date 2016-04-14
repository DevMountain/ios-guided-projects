//
//  SenderViewController.swift
//  NotificationMiniProject2
//
//  Created by Parker Donat on 4/11/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit

class SenderViewController: UIViewController, UITextFieldDelegate {
    
    let kText = "text"
    
    @IBOutlet weak var senderTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllTabs()
    }
    
    func loadAllTabs() {
        guard let viewControllers = self.tabBarController?.viewControllers else {return}
        for vc in viewControllers {
            if vc != self {
                let _ = vc.view
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func sendButtonTapped(sender: AnyObject) {
        guard let text = senderTextField.text else {return}
        NSNotificationCenter.defaultCenter().postNotificationName("sendButtonTapped", object: nil, userInfo: [kText: text])
    }
    
}
