//
//  Cannon.swift
//  FunFacts
//
//  Created by LTT on 5/14/19.
//  Copyright © 2019 Bohan Yang. All rights reserved.
//

import Foundation

class Cannon: Chariot {
    override func canMoveTo() -> [Position] {
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
                if Position(x: xx, y: y).findPiece(in: allPieces) == nil{
                    result.append(Position(x: xx, y: y))
                } else {
                    if (xx + 1) <= xUpperBound{
                        for xxx in (xx+1)...xUpperBound {
                            if let piece = Position(x: xxx, y: y).findPiece(in: allPieces) {
                                if isEnemy(against: piece){
                                    result.append(Position(x: xxx, y: y))
                                    break
                                }
                                break
                            }
                        }
                    }
                    break
                }
            }
        }
        if xLowerBound <= (x-1) {
            for xx in stride(from: (x-1), through: xLowerBound, by: -1) {
                if Position(x: xx, y: y).findPiece(in: allPieces) == nil{
                    result.append(Position(x: xx, y: y))
                } else {
                    if xLowerBound <= (xx - 1){
                        for xxx in stride(from: (xx-1), through: xLowerBound, by: -1){
                            if let piece = Position(x: xxx, y: y).findPiece(in: allPieces) {
                                if isEnemy(against: piece){
                                    result.append(Position(x: xxx, y: y))
                                    break
                                }
                                break
                            }
                        }
                    }
                    break
                }
            }
        }
        if (y+1) <= yUpperBound {
            for yy in (y+1)...yUpperBound {
                if Position(x: x, y: yy).findPiece(in: allPieces) == nil{
                    result.append(Position(x: x, y: yy))
                } else {
                    if (yy + 1) <= yUpperBound{
                        for yyy in (yy + 1)...yUpperBound{
                            if let piece = Position(x:x, y: yyy).findPiece(in: allPieces){
                                if isEnemy(against: piece){
                                    result.append(Position(x: x, y: yyy))
                                    break
                                }
                                break
                            }
                        }
                    }
                    break
                }
            }
        }
        if yLowerBound <= (y-1) {
            for yy in stride(from: (y-1), through: yLowerBound, by: -1) {
                if Position(x: x, y: yy).findPiece(in: allPieces) == nil{
                    result.append(Position(x: x, y: yy))
                } else {
                    if yLowerBound <= (yy - 1) {
                        for yyy in stride(from: (yy-1), through: yLowerBound, by: -1){
                            if let piece = Position(x: x, y: yyy).findPiece(in: allPieces){
                                if isEnemy(against: piece){
                                    result.append(Position(x: x, y: yyy))
                                    break
                                }
                                break
                            }
                        }
                    }
                    break
                }
            }
        }
        return result
    } // end of canMoveTo()
}
