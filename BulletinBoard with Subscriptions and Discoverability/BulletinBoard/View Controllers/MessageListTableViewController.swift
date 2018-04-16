//
//  MessageListTableViewController.swift
//  BulletinBoard
//
//  Created by Spencer Curtis on 1/24/18.
//  Copyright © 2018 Spencer Curtis. All rights reserved.
//

import UIKit

class MessageListTableViewController: UITableViewController {

    @IBOutlet weak var messageTextField: UITextField!
    
    let dateFormatter: DateFormatter = {
       
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(reloadViews), name: MessageController.shared.messagesWereUpdatedNotification, object: nil)
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        MessageController.shared.fetchMessageRecordsFromiCloud()
    }
    
    @objc func reloadViews() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.tableView.reloadData()
        }
    }
    
    @IBAction func postMessageButtonTapped(_ sender: Any) {
        
        guard let messageText = messageTextField.text else { return }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true   
        MessageController.shared.saveMessageRecordToiCloudWith(text: messageText)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageController.shared.messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)

        let message = MessageController.shared.messages[indexPath.row]
        
        cell.textLabel?.text = message.text
        cell.detailTextLabel?.text = dateFormatter.string(from: message.timestamp)

        return cell
    }
    
}
