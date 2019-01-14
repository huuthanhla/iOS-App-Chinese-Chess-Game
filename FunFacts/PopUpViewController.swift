//
//  PopUpViewController.swift
//  FunFacts
//
//  Created by Bohan Yang on 1/11/18.
//  Copyright © 2018 Bohan Yang. All rights reserved.
//

import UIKit

protocol sendDataToViewProtocol {
    func reset()
}

class PopUpViewController: UIViewController {
     var delegate: sendDataToViewProtocol? = nil
    
    @IBOutlet weak var textGreat: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        if (delegate != nil){
            delegate?.reset()
        }
        self.view.removeFromSuperview()
        //https://www.youtube.com/watch?v=FgCIRMz_3dE
    }
    
    
}
