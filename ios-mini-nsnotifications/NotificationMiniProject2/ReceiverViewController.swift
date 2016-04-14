//
//  ReceiverViewController.swift
//  NotificationMiniProject2
//
//  Created by Parker Donat on 4/11/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit

class ReceiverViewController: UIViewController {

    let kText = "text"
    
    @IBOutlet weak var receiverLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNSNotifications()
    }
    
    func registerNSNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ReceiverViewController.receivedNotification(_:)), name: "sendButtonTapped", object: nil)
    }

    func receivedNotification(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
            text = userInfo[kText] as? String else {return}
            receiverLabel.text = text
    }

}
