//
//  CharacterDetailViewController.swift
//  HarryPotterCodable
//
//  Created by Aaron Martinez on 12/5/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var patronusLabel: UILabel!
    
    var character: Character?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func updateViews() {
        guard let character = character
        else { print("The character property in the \(#function) was nil"); return }
        
        DispatchQueue.main.async {
            self.nameLabel.text = character.name
            self.houseLabel.text = character.house
            self.patronusLabel.text = character.patronus
            self.imageView.image = character.image
        }
    }
}
