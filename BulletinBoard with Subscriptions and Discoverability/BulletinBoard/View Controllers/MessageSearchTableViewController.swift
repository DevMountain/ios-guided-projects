//
//  MessageSearchTableViewController.swift
//  BulletinBoard
//
//  Created by Spencer Curtis on 1/29/18.
//  Copyright © 2018 Spencer Curtis. All rights reserved.
//

import UIKit

class MessageSearchTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    let dateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadViews), name: MessageController.shared.messagesWereUpdatedNotification, object: nil)
    }
    
    @objc func reloadViews() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.tableView.reloadData()
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let email = searchBar.text else { return }

        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        MessageController.shared.fetchMessagesFromUserWith(email: email)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageController.shared.searchedUserMessages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)

        let message = MessageController.shared.searchedUserMessages[indexPath.row]
        
        cell.textLabel?.text = message.text
        cell.detailTextLabel?.text = dateFormatter.string(from: message.timestamp)

        return cell
    }
}
