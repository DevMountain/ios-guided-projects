//
//  ViewController.swift
//  DeckOfOneCard
//
//  Created by James Pacheco on 4/18/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func drawButtonTapped(sender: AnyObject) {
        CardController.drawCard { (card) in
            guard let card = card else {return}
            ImageController.imageForURL(card.imageEndpoint, completion: { (image) in
                guard let image = image  else { return}
                dispatch_async(dispatch_get_main_queue(), { 
                    self.cardImageView.image = image
                })
            })
        }
    }
    
    
}

