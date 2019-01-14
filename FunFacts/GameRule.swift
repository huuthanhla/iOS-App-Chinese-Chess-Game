//
//  GameRule.swift
//  FunFacts
//
//  Created by Bohan Yang on 1/5/18.
//  Copyright © 2018 Bohan Yang. All rights reserved.
//

import Foundation
import UIKit

struct Position {
    var x: Int
    var y: Int
    static let lowerYRange = 1
    static let upperYRange = 10
    static let lowerXRange = 1
    static let upperXRange = 9
    
    static func clickablePositions(in array: [Piece]) -> [Position]{
        var result: [Position] = []
        for element in array {
            if element.isActive(){
                result.append(element.currentPosition)
            }
        }
        return result
    }
    
    func findPiece(in array: [Piece]) -> Piece? {
        for element in array {
            if (element.currentPosition.x == x && element.currentPosition.y == y){
                return element
            }
        }
        return nil
    }
    
    func isMyPiece(of piece: Piece) -> Bool {
        return count%2 == piece.id/17
    }
    
    func isIncluded (in array: [Position]) -> Bool {
        for element in array {
            if x == element.x && y == element.y {
                return true
            }
        }
        return false
    }
    
}

protocol Piece {
    var id: Int { get }
    var name: String { get }
    var life: Int { get set }
    var initPosition: Position { get }
    var currentPosition: Position { get set }
    func Range() -> [Int]
    func isEnemy(against piece: Piece) -> Bool
    func canMoveTo() -> [Position]
    func moving(to selectedPosition: Position)
    func isTaken()
    func isActive() -> Bool
}



var count = 1
var allPieces: [Piece] = [chariot1, knight1, bishop1, guard1, king1, cannon1, cannon2, guard2, bishop2, knight2, chariot2, soldrier1, soldrier2, soldrier3, soldrier4, soldrier5, chariot3, knight3, cannon3, bishop3, guard3, king2, guard4, bishop4, cannon4, knight4, chariot4, soldrier6, soldrier7, soldrier8, soldrier9, soldrier10]

func resetAllPieces(){
    var x = 0
    while x < allPieces.count {
        allPieces[x].currentPosition = allPieces[x].initPosition
        allPieces[x].life = 1
        x += 1
        
    }
}

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

class BishopUpside: Chariot {
    override func Range() -> [Int] {
        return [9, 1, 5, 1]
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
        
        if Position(x: x+1, y: y+1).findPiece(in: allPieces) == nil{
            r1.append(Position(x: x+2, y: y+2))
        }
        if Position(x: x-1, y: y-1).findPiece(in: allPieces) == nil{
            r1.append(Position(x: x-2, y: y-2))
        }
        if Position(x: x+1, y: y-1).findPiece(in: allPieces) == nil{
            r1.append(Position(x: x+2, y: y-2))
        }
        if Position(x: x-1, y: y+1).findPiece(in: allPieces) == nil{
            r1.append(Position(x: x-2, y: y+2))
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
}

class BishopDownside: BishopUpside {
    override func Range() -> [Int] {
        return [9, 1, 10, 6]
    }
}

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
class GuardDownside: GuardUpside {
    override func Range() -> [Int] {
        return [6, 4, 10, 8]
    }
}
class KingUpside: GuardUpside {
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
        
        r1.append(Position(x: x+1, y: y))
        r1.append(Position(x: x-1, y: y))
        r1.append(Position(x: x, y: y-1))
        r1.append(Position(x: x, y: y+1))
        
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
class KingDownside: KingUpside {
    override func Range() -> [Int] {
        return [6, 4, 10, 8]
    }
}
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
class SoldierDownside: Chariot {
    override func Range() -> [Int] {
        return [9, 1, 7, 1]
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
        
        if y == 6 || y == 7{
            r0.append(Position(x: x, y: y-1))
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
            r1.append(Position(x: x, y: y-1))
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


var chariot1 = Chariot(name: "chariot1", id: 1, x: 1, y: 1)
var knight1 = Knight(name: "knight1", id: 2, x: 2, y: 1)
var cannon1 = Cannon(name: "cannon1", id: 3, x: 2, y: 3)
var bishop1 = BishopUpside(name: "bishop1", id: 4, x: 3, y: 1)
var guard1 = GuardUpside(name: "guard1", id: 5, x: 4, y: 1)
var king1 = KingUpside(name: "king1", id: 6, x: 5, y: 1)
var guard2 = GuardUpside(name: "guard2", id: 7, x: 6, y: 1)
var bishop2 = BishopUpside(name: "bishop2", id: 8, x: 7, y: 1)
var cannon2 = Cannon(name: "cannon2", id: 9, x: 8, y: 3)
var knight2 = Knight(name: "knight2", id: 10, x: 8, y: 1)
var chariot2 = Chariot(name: "chariot1", id: 11, x: 9, y: 1)
var soldrier1 = SoldierUpside(name: "soldrier1", id: 12, x: 1, y: 4)
var soldrier2 = SoldierUpside(name: "soldrier2", id: 13, x: 3, y: 4)
var soldrier3 = SoldierUpside(name: "soldrier3", id: 14, x: 5, y: 4)
var soldrier4 = SoldierUpside(name: "soldrier4", id: 15, x: 7, y: 4)
var soldrier5 = SoldierUpside(name: "soldrier5", id: 16, x: 9, y: 4)

var chariot3 = Chariot(name: "chariot3", id: 17, x: 1, y: 10)
var knight3 = Knight(name: "knight3", id: 18, x: 2, y: 10)
var cannon3 = Cannon(name: "cannon3", id: 19, x: 2, y: 8)
var bishop3 = BishopDownside(name: "bishop3", id: 20, x: 3, y: 10)
var guard3 = GuardDownside(name: "guard3", id: 21, x: 4, y: 10)
var king2 = KingDownside(name: "king2", id: 22, x: 5, y: 10)
var guard4 = GuardDownside(name: "guard4", id: 23, x: 6, y: 10)
var bishop4 = BishopDownside(name: "bishop4", id: 24, x: 7, y: 10)
var cannon4 = Cannon(name: "cannon4", id: 25, x: 8, y: 8)
var knight4 = Knight(name: "knight4", id: 26, x: 8, y: 10)
var chariot4 = Chariot(name: "chariot4", id: 27, x: 9, y: 10)
var soldrier6 = SoldierDownside(name: "soldrier6", id: 28, x: 1, y: 7)
var soldrier7 = SoldierDownside(name: "soldrier7", id: 29, x: 3, y: 7)
var soldrier8 = SoldierDownside(name: "soldrier8", id: 30, x: 5, y: 7)
var soldrier9 = SoldierDownside(name: "soldrier9", id: 31, x: 7, y: 7)
var soldrier10 = SoldierDownside(name: "soldrier10", id: 32, x: 9, y: 7)

/*
allPieces = [chariot1, knight1, cannon1, bishop1, guard1, king1, guard2, bishop2, cannon2, knight2, chariot2, soldrier1, soldrier2, soldrier3, soldrier4, soldrier5, chariot3, knight3, cannon3, bishop3, guard3, king2, guard4, bishop4, cannon4, knight4, chariot4, soldrier6, soldrier7, soldrier8, soldrier9, soldrier10]
*/
