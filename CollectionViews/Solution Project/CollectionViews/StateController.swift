//
//  StateController.swift
//  CollectionViews
//
//  Created by Spencer Curtis on 3/9/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import Foundation

class StateController {
    
    static let shared = StateController()
    
    var states: [State] = []
    
    init() {
        self.states = createAllStates()
    }
    
    func createAllStates() -> [State] {
        
        var placeholderStates: [State] = []
        
        for stateFullName in StateHelper.fullNames {
            
            guard let index = StateHelper.fullNames.index(of: stateFullName) else { return [] }
            
            let abbreviation = StateHelper.abbreviations[index]
            
            let state = State(name: stateFullName, abbreviation: abbreviation)
            
            placeholderStates.append(state)
        }
        
        return placeholderStates
    }
}












