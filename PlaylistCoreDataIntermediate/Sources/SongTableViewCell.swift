//
//  SongTableViewCell.swift
//  PlaylistCoreData
//
//  Created by Andrew Madsen on 10/6/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
	
	override func prepareForReuse() {
		song = nil
	}
	
	@IBAction func favoriteButtonTapped(_ sender: AnyObject) {
		guard let song = song else { return }
		song.favorite = !song.favorite
		updateViews()
	}
	
	// MARK: Private
	
	private func updateViews() {
		guard let song = song else { return }
		
		nameLabel?.text = song.name
		artistLabel?.text = song.artist
		
		let imageName = song.favorite ? "SolidStar" : "EmptyStar"
		favoriteButton.setImage(UIImage(named: imageName), for: .normal)
	}
	
	// MARK: Properties
	
	var song: Song? {
		didSet {
			updateViews()
		}
	}
	
	@IBOutlet var favoriteButton: UIButton!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var artistLabel: UILabel!
}
