//
//  CharactersTableViewController.swift
//  HarryPotterCodable
//
//  Created by Aaron Martinez on 12/5/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import UIKit

class CharactersTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        CharacterController.shared.fetchAllCharacters {
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CharacterController.shared.characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)

        let character = CharacterController.shared.characters[indexPath.row]
        
        cell.textLabel?.text = character.name

        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailVC" {
            guard let destination = segue.destination as? CharacterDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow
                else { return }
            let character = CharacterController.shared.characters[indexPath.row]
            destination.character = character
        }
    }
}
