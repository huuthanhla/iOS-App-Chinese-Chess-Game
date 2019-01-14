//
//  FactProvider.swift
//  FunFacts
//
//  Created by Bohan Yang on 12/26/17.
//  Copyright © 2017 Bohan Yang. All rights reserved.
//
import GameKit


struct FactProvider {
    
    let facts = ["fact 1, to make it longer to test auto layout!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", "fact 2", "fact 3", "fact 4", "fact 5"]
    
    func randomFact() -> String {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: facts.count)
        return facts[randomNumber]
    }
}

struct FactProvider2 {
    
    let facts = ["fact 1", "fact 2", "fact 3", "fact 4", "fact 5"]
    
    func randomFact() -> String {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: facts.count)
        return facts[randomNumber]
    }
}

