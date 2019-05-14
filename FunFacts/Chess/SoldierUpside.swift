//
//  SoldierUpside.swift
//  FunFacts
//
//  Created by LTT on 5/14/19.
//  Copyright © 2019 Bohan Yang. All rights reserved.
//

import Foundation

class SoldierUpside: Chariot {
    override func Range() -> [Int] {
        return [9, 1, 10, 4]
    }
    override func canMoveTo() -> [Position] {
        var result: [Position] = []
        var r0: [Position] = []
        var r1: [Position] = []
        var r2: [Position] = []
        let x = currentPosition.x
        let y = currentPosition.y
        let bounds = Range()
        let xUpperBound = bounds[0]
        let xLowerBound = bounds[1]
        let yUpperBound = bounds[2]
        let yLowerBound = bounds[3]
        
        if y == 4 || y == 5{
            r0.append(Position(x: x, y: y+1))
            for element in r0 {
                if let piece = element.findPiece(in: allPieces){
                    if isEnemy(against: piece){
                        result.append(element)
                    }
                } else {
                    result.append(element)
                }
            }
        } else {
            r1.append(Position(x: x, y: y+1))
            r1.append(Position(x: x+1, y: y))
            r1.append(Position(x: x-1, y: y))
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
        }
        return result
    }
}
