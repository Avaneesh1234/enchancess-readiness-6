//
//  WelcomeViewController.swift
//  enchancess readiness 6
//
//  Created by CoopStudent on 7/27/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var roundedCornerButton: UIButton!
    
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colorTop = UIColor(red: 0.87, green: 0.37, blue: 0.54, alpha: 1.00).cgColor
        let colorBottom = UIColor(red: 0.43, green: 0.84, blue: 0.93, alpha: 1.00).cgColor
        
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.frame = self.bgView.bounds
        gradiantLayer.colors = [colorTop, colorBottom]
        self.bgView.layer.insertSublayer(gradiantLayer, at: 0)
        
        //rounded corner Welcome 
        roundedCornerButton.layer.cornerRadius = 15
        roundedCornerButton.layer.masksToBounds = true
        
        
        
    }
    

   

}
