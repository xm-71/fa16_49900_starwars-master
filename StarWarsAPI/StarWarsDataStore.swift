//
//  StarWarsDataStore.swift
//  StarWarsAPI
//
//  Created by Rob Elliott on 11/11/16.
//  Copyright © 2016 Rob Elliott. All rights reserved.
//

import Foundation

class StarWarsDataStore: NSObject {
    
    // MAKE THIS CLASS A SINGLETON
    static let sharedInstance = StarWarsDataStore()
    
    
    // DECLARE ARRAYS THAT HOLD OBJECTS OF SPECIFIC MODEL CLASSES
    var allPeople = [Person]()
    var allPlanets = [Planet]()
    var allSpecies = [Species]()
    var allStarships = [Starship]()
    var allFilms = [Film]()
    
}