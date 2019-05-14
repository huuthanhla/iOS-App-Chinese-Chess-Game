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
