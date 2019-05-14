//
//  GuardUpside.swift
//  FunFacts
//
//  Created by LTT on 5/14/19.
//  Copyright © 2019 Bohan Yang. All rights reserved.
//

import Foundation

class GuardUpside: Chariot {
    override func Range() -> [Int] {
        return [6, 4, 3, 1]
    }
    override func canMoveTo() -> [Position] {
        var result: [Position] = []
        var r1: [Position] = []
        var r2: [Position] = []
        let x = currentPosition.x
        let y = currentPosition.y
        let bounds = Range()
        let xUpperBound = bounds[0]
        let xLowerBound = bounds[1]
        let yUpperBound = bounds[2]
        let yLowerBound = bounds[3]
        
        r1.append(Position(x: x+1, y: y+1))
        r1.append(Position(x: x-1, y: y+1))
        r1.append(Position(x: x+1, y: y-1))
        r1.append(Position(x: x-1, y: y-1))
        
        for element in r1 {
            if (element.x <= xUpperBound) && (element.x >= xLowerBound) && (element.y <= yUpperBound) && (element.y >= yLowerBound) {
                r2.append(element)
            }
        }
        for element in r2 {
            if let piece = element.findPiece(in: allPieces){
                if isEnemy(against: piece){
                    result.append(element)
                }
            } else {
                result.append(element)
            }
        }
        return result
    }
}
