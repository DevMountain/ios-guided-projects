//
//  ViewController.swift
//  DeckOfOneCard
//
//  Created by James Pacheco on 4/18/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
    @IBAction func drawButtonTapped(_ sender: AnyObject) {
		CardController.draw(numberOfCards: 1) { (cards) in
            guard let card = cards.first else { return }
			ImageController.image(forURL: card.imageEndpoint) { (image) in
                guard let image = image  else { return }
                self.cardImageView.image = image
            }
        }
    }
	
	// MARK: Properties
	
	@IBOutlet weak var cardImageView: UIImageView!
}

