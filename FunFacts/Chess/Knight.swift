//
//  Knight.swift
//  FunFacts
//
//  Created by LTT on 5/14/19.
//  Copyright © 2019 Bohan Yang. All rights reserved.
//

import Foundation

class Knight: Chariot {
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
        
        if Position(x: x+1, y: y).findPiece(in: allPieces) == nil{
            r1.append(Position(x: x+2, y: y+1))
            r1.append(Position(x: x+2, y: y-1))
        }
        if Position(x: x-1, y: y).findPiece(in: allPieces) == nil{
            r1.append(Position(x: x-2, y: y+1))
            r1.append(Position(x: x-2, y: y-1))
        }
        if Position(x: x, y: y+1).findPiece(in: allPieces) == nil{
            r1.append(Position(x: x+1, y: y+2))
            r1.append(Position(x: x-1, y: y+2))
        }
        if Position(x: x, y: y-1).findPiece(in: allPieces) == nil{
            r1.append(Position(x: x+1, y: y-2))
            r1.append(Position(x: x-1, y: y-2))
        }
        
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
    /*
     internal func excludeMyPiece (in array: [Position]) -> [Position]{
     var result: [Position] = []
     for element in array {
     if let piece = element.findPiece(in: allPieces){
     if isEnemy(against: piece){
     result.append(element)
     }
     } else {
     result.append(element)
     }
     }
     return result
     }*/
}
