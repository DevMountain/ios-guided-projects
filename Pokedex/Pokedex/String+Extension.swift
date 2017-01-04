//
//  String+Extension.swift
//  Pokedex
//
//  Created by Nicholas Laughter on 1/4/17.
//  Copyright © 2017 MichaelMecham. All rights reserved.
//

import Foundation

extension String {
    
    // MARK: - Capitalizes first letter of any String
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    // MARK: - Capitalize first letter in place
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
