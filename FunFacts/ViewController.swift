//
//  ViewController.swift
//  FunFacts
//
//  Created by Bohan Yang on 12/26/17.
//  Copyright © 2017 Bohan Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, sendDataToViewProtocol {
    
    let factProvider = FactProvider2()
    var selectedPiece: [Piece] = []
    var selectedImgView: [UIImageView] = []
    var canMoveToPositions: [Position] = []
    var imgViewPosition: [UIImageView: CGPoint] = [:]
    
    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var redChariot1: UIImageView!
    @IBOutlet weak var redKnight1: UIImageView!
    @IBOutlet weak var redBishop1: UIImageView!
    @IBOutlet weak var redGuard1: UIImageView!
    @IBOutlet weak var redKing: UIImageView!
    @IBOutlet weak var redGuard2: UIImageView!
    @IBOutlet weak var redBishop2: UIImageView!
    @IBOutlet weak var redKnight2: UIImageView!
    @IBOutlet weak var redChariot2: UIImageView!
    @IBOutlet weak var redCannon1: UIImageView!
    @IBOutlet weak var redCannon2: UIImageView!
    @IBOutlet weak var redSoldier1: UIImageView!
    @IBOutlet weak var redSoldier2: UIImageView!
    @IBOutlet weak var redSoldier3: UIImageView!
    @IBOutlet weak var redSoldier4: UIImageView!
    @IBOutlet weak var redSoldier5: UIImageView!
    @IBOutlet weak var greenSoldier1: UIImageView!
    @IBOutlet weak var greenSoldier2: UIImageView!
    @IBOutlet weak var greenSoldier3: UIImageView!
    @IBOutlet weak var greenSoldier4: UIImageView!
    @IBOutlet weak var greenSoldier5: UIImageView!
    @IBOutlet weak var greenCannon1: UIImageView!
    @IBOutlet weak var greenCannon2: UIImageView!
    @IBOutlet weak var greenChariot1: UIImageView!
    @IBOutlet weak var greenKnight1: UIImageView!
    @IBOutlet weak var greenBishop1: UIImageView!
    @IBOutlet weak var greenGuard1: UIImageView!
    @IBOutlet weak var greenKing: UIImageView!
    @IBOutlet weak var greenGuard2: UIImageView!
    @IBOutlet weak var greenBishop2: UIImageView!
    @IBOutlet weak var greenKnight2: UIImageView!
    @IBOutlet weak var greenChariot2: UIImageView!
   
    func instantiateEveything() {
        
        // load images
        funFactLabel.text = factProvider.randomFact()
        imageView.image = UIImage(named:"hh 2.png")
        redChariot1.image = UIImage(named: "Red_Root.png")
        redChariot2.image = UIImage(named: "Red_Root copy.png")
        redKnight1.image = UIImage(named: "Red_Ma.png")
        redKnight2.image = UIImage(named: "Red_Ma copy.png")
        redBishop1.image = UIImage(named: "Red_Xiang.png")
        redBishop2.image = UIImage(named: "Red_Xiang copy.png")
        redGuard1.image = UIImage(named: "Red_Shi.png")
        redGuard2.image = UIImage(named: "Red_Shi copy.png")
        redCannon1.image = UIImage(named: "Red_Pao.png")
        redCannon2.image = UIImage(named: "Red_Pao copy.png")
        redKing.image = UIImage(named: "Red_King.png")
        redSoldier1.image = UIImage(named: "Red_Bing.png")
        redSoldier2.image = UIImage(named: "Red_Bing copy.png")
        redSoldier3.image = UIImage(named: "Red_Bing copy 2.png")
        redSoldier4.image = UIImage(named: "Red_Bing copy 3.png")
        redSoldier5.image = UIImage(named: "Red_Bing copy 4.png")
        greenChariot1.image = UIImage(named: "Green_Che.png")
        greenChariot2.image = UIImage(named: "Green_Che copy.png")
        greenKnight1.image = UIImage(named: "Green_Ma.png")
        greenKnight2.image = UIImage(named: "Green_Ma copy.png")
        greenCannon1.image = UIImage(named: "Green_Pao.png")
        greenCannon2.image = UIImage(named: "Green_Pao copy.png")
        greenBishop1.image = UIImage(named: "Green_Xiang.png")
        greenBishop2.image = UIImage(named: "Green_Xiang copy.png")
        greenGuard1.image = UIImage(named: "Green_Shi.png")
        greenGuard2.image = UIImage(named: "Green_Shi copy.png")
        greenKing.image = UIImage(named: "Green_King.png")
        greenSoldier1.image = UIImage(named: "Green_Zu.png")
        greenSoldier2.image = UIImage(named: "Green_Zu copy.png")
        greenSoldier3.image = UIImage(named: "Green_Zu copy 2.png")
        greenSoldier4.image = UIImage(named: "Green_Zu copy 3.png")
        greenSoldier5.image = UIImage(named: "Green_Zu copy 4.png")
        
        // set images
        redChariot1.center = convertPositionToCgpoint(position: chariot1.initPosition)
        redKnight1.center = convertPositionToCgpoint(position: knight1.initPosition)
        redBishop1.center = convertPositionToCgpoint(position: bishop1.initPosition)
        redGuard1.center = convertPositionToCgpoint(position: guard1.initPosition)
        redKing.center = convertPositionToCgpoint(position: king1.initPosition)
        redGuard2.center = convertPositionToCgpoint(position: guard2.initPosition)
        redBishop2.center = convertPositionToCgpoint(position: bishop2.initPosition)
        redKnight2.center = convertPositionToCgpoint(position: knight2.initPosition)
        redChariot2.center = convertPositionToCgpoint(position: chariot2.initPosition)
        redCannon1.center = convertPositionToCgpoint(position: cannon1.initPosition)
        redCannon2.center = convertPositionToCgpoint(position: cannon2.initPosition)
        redSoldier1.center = convertPositionToCgpoint(position: soldrier1.initPosition)
        redSoldier2.center = convertPositionToCgpoint(position: soldrier2.initPosition)
        redSoldier3.center = convertPositionToCgpoint(position: soldrier3.initPosition)
        redSoldier4.center = convertPositionToCgpoint(position: soldrier4.initPosition)
        redSoldier5.center = convertPositionToCgpoint(position: soldrier5.initPosition)
        greenChariot1.center = convertPositionToCgpoint(position: chariot3.initPosition)
        greenChariot2.center = convertPositionToCgpoint(position: chariot4.initPosition)
        greenKnight1.center = convertPositionToCgpoint(position: knight3.initPosition)
        greenKnight2.center = convertPositionToCgpoint(position: knight4.initPosition)
        greenCannon1.center = convertPositionToCgpoint(position: cannon3.initPosition)
        greenCannon2.center = convertPositionToCgpoint(position: cannon4.initPosition)
        greenBishop1.center = convertPositionToCgpoint(position: bishop3.initPosition)
        greenBishop2.center = convertPositionToCgpoint(position: bishop4.initPosition)
        greenGuard1.center = convertPositionToCgpoint(position: guard3.initPosition)
        greenGuard2.center = convertPositionToCgpoint(position: guard4.initPosition)
        greenKing.center = convertPositionToCgpoint(position: king2.initPosition)
        greenSoldier1.center = convertPositionToCgpoint(position: soldrier6.initPosition)
        greenSoldier2.center = convertPositionToCgpoint(position: soldrier7.initPosition)
        greenSoldier3.center = convertPositionToCgpoint(position: soldrier8.initPosition)
        greenSoldier4.center = convertPositionToCgpoint(position: soldrier9.initPosition)
        greenSoldier5.center = convertPositionToCgpoint(position: soldrier10.initPosition)
        
        // imgView: position dictionary
        imgViewPosition.removeAll()
        imgViewPosition = [redChariot1: redChariot1.center, redChariot2: redChariot2.center, redKnight1: redKnight1.center, redKnight2: redKnight2.center, redBishop1: redBishop1.center, redBishop2: redBishop2.center, redGuard1: redGuard1.center, redGuard2: redGuard2.center, redKing: redKing.center, redCannon1: redCannon1.center, redCannon2: redCannon2.center, redSoldier1: redSoldier1.center, redSoldier2: redSoldier2.center, redSoldier3: redSoldier3.center, redSoldier4: redSoldier4.center, redSoldier5: redSoldier5.center, greenChariot1: greenChariot1.center, greenChariot2: greenChariot2.center, greenKnight1: greenKnight1.center, greenKnight2: greenKnight2.center, greenCannon1: greenCannon1.center, greenCannon2: greenCannon2.center, greenBishop1: greenBishop1.center, greenBishop2: greenBishop2.center, greenGuard1: greenGuard1.center, greenGuard2: greenGuard2.center, greenKing: greenKing.center, greenSoldier1: greenSoldier1.center, greenSoldier2: greenSoldier2.center, greenSoldier3: greenSoldier3.center, greenSoldier4: greenSoldier4.center, greenSoldier5: greenSoldier5.center]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instantiateEveything()
    }
    
    func reset(){
        count = 1
        resetAllPieces()
        instantiateEveything()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = ((touches as NSSet).anyObject() as AnyObject)
        let p = touch.location(in: imageView)
        let point = CGPoint(x: p.x + imageView.frame.origin.x, y: p.y + imageView.frame.origin.y)
        let position = convertCgpointToPosition(cgp: point)
        print(position)
        
        if (positionHasMyPiece(at: position)){
            if let imgV = findImageView(given: position), let piece = position.findPiece(in: allPieces) {
                clearAll()
                selectedPiece.append(piece)
                selectedImgView.append(imgV)
                canMoveToPositions = piece.canMoveTo()
            }
        } else {
            if position.isIncluded(in: canMoveToPositions){
                if let piece = position.findPiece(in: allPieces), let imgV = findImageView(given: position){
                    print("eat")
                    imgV.image = nil
                    imgViewPosition.removeValue(forKey: imgV)
                    piece.isTaken()
                }
                selectedPiece[0].moving(to: position)
                UIView.animate(withDuration: 0.1) {
                    self.selectedImgView[0].center = self.convertPositionToCgpoint(position: self.selectedPiece[0].currentPosition)
                }
                imgViewPosition[selectedImgView[0]] = selectedImgView[0].center
                clearAll()
                count += 1
                if gameOver() {
                    gameOverProcedure()
                }
            }
        }
    } // end of touchesBegan
    
    @IBAction func showFact() {
        funFactLabel.text = factProvider.randomFact()
        print("clicked")
    }
    
    func gameOver() -> Bool{
        return !(king1.isActive() && king2.isActive())
    }
    
    func gameOverProcedure(){
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpId") as! PopUpViewController
        popOverVC.delegate = self
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    func positionHasMyPiece(at position: Position) -> Bool {
        if let piece = position.findPiece(in: allPieces) {
            if position.isMyPiece(of: piece){
                return true
            }
        }
        return false
    }
    
    func findImageView(given position: Position) -> UIImageView? {
        for element in self.imgViewPosition{
            if convertCgpointToPosition(cgp: element.value).x == position.x && convertCgpointToPosition(cgp: element.value).y == position.y {
                return element.key
            }
        }
        return nil
    }

    func convertPositionToCgpoint (position: Position) -> CGPoint {
        let widthFactor = imageView.frame.size.width/9
        let heightFactor = imageView.frame.size.height/10
        let xx = (Double.init(position.x) - 0.5) * Double.init(widthFactor)
        let yy = (Double.init(position.y) - 0.5) * Double.init(heightFactor)
        return CGPoint(x: xx + Double.init(imageView.frame.origin.x), y: yy + Double.init(imageView.frame.origin.y))
    }
    
    func convertCgpointToPosition (cgp: CGPoint) -> Position {
        let widthFactor = imageView.frame.size.width/9
        let heightFactor = imageView.frame.size.height/10
        
        let x = Int.init((cgp.x-imageView.frame.origin.x) / widthFactor)+1
        let y = Int.init((cgp.y-imageView.frame.origin.y) / heightFactor)+1
        return Position(x: x, y: y)
    }
    
    func clearAll() {
        selectedPiece.removeAll()
        canMoveToPositions.removeAll()
        selectedImgView.removeAll()
    }
}

























































