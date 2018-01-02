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
        
        guard let character = character else { print("The character property in the \(#function) was nil"); return }
        
        if let imageURL = URL(string: character.imageURL) {
            
            CharacterController.shared.fetchImage(at: imageURL) { (image) in
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
        
        DispatchQueue.main.async {
            self.nameLabel.text = character.name
            self.houseLabel.text = "House: \(character.house)"
            self.patronusLabel.text = "Patronus: \(character.patronus)"
        }
    }
}

