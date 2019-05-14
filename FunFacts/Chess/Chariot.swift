//
//  Chariot.swift
//  FunFacts
//
//  Created by LTT on 5/14/19.
//  Copyright © 2019 Bohan Yang. All rights reserved.
//

import Foundation

class Chariot: Piece {
    let id: Int
    let name: String
    var life: Int = 1
    let initPosition: Position
    var currentPosition: Position
    
    init (name: String, id: Int, x: Int, y: Int) {
        self.name = name
        self.id = id
        self.initPosition = Position(x: x, y: y)
        self.currentPosition = Position(x: x, y: y)
    }
    
    func Range() -> [Int] {
        var result: [Int] = []
        result.append(Position.upperXRange)
        result.append(Position.lowerXRange)
        result.append(Position.upperYRange)
        result.append(Position.lowerYRange)
        return result
    }
    
    func isEnemy(against piece: Piece) -> Bool {
        return id/17 != piece.id/17
    }
    
    func canMoveTo() -> [Position] {
        var result: [Position] = []
        let x = currentPosition.x
        let y = currentPosition.y
        let bounds = Range()
        let xUpperBound = bounds[0]
        let xLowerBound = bounds[1]
        let yUpperBound = bounds[2]
        let yLowerBound = bounds[3]
        
        if (x+1) <= xUpperBound {
            for xx in (x+1)...xUpperBound {
                if let piece = Position(x: xx, y: y).findPiece(in: allPieces){
                    if isEnemy(against: piece){
                        result.append(Position(x: xx, y: y))
                    }
                    break
                }
                result.append(Position(x: xx, y: y))
            }
        }
        if xLowerBound <= (x-1) {
            for xx in stride(from: (x-1), through: xLowerBound, by: -1) {
                if let piece = Position(x: xx, y: y).findPiece(in: allPieces){
                    if isEnemy(against: piece){
                        result.append(Position(x: xx, y: y))
                    }
                    break
                }
                result.append(Position(x: xx, y: y))
            }
        }
        if (y+1) <= yUpperBound {
            for yy in (y+1)...yUpperBound {
                if let piece = Position(x: x, y: yy).findPiece(in: allPieces){
                    if isEnemy(against: piece){
                        result.append(Position(x: x, y: yy))
                    }
                    break
                }
                result.append(Position(x: x, y: yy))
            }
        }
        if yLowerBound <= (y-1) {
            for yy in stride(from: (y-1), through: yLowerBound, by: -1) {
                if let piece = Position(x: x, y: yy).findPiece(in: allPieces){
                    if isEnemy(against: piece){
                        result.append(Position(x: x, y: yy))
                    }
                    break
                }
                result.append(Position(x: x, y: yy))
            }
        }
        return result
    } // end of canMoveTo()
    
    func moving(to selectedPosition: Position) {
        if let piece = selectedPosition.findPiece(in: allPieces) {
            if isEnemy(against: piece){
                piece.isTaken()
                currentPosition = selectedPosition
            }
        } else{
            currentPosition = selectedPosition
        }
    }
    
    func isTaken() {
        currentPosition = Position(x: 0, y: 0)
        life -= 1
    }
    
    func isActive() -> Bool {
        if life == 1{
            return true
        } else {
            return false
        }
    }
    
}
