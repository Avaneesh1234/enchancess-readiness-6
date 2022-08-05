//
//  HomeViewController.swift
//  enchancess readiness 6
//
//  Created by CoopStudent on 7/27/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var roundedButton: UIButton!
    
    @IBOutlet weak var roundedButtonArticle: UIButton!
    
    
    @IBOutlet weak var roundedButtonTests: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        roundedButton.layer.cornerRadius = 15
        roundedButton.layer.masksToBounds = true
        roundedButtonArticle.layer.cornerRadius = 15
        roundedButtonArticle.layer.masksToBounds = true
        roundedButtonTests.layer.cornerRadius = 15
        roundedButtonTests.layer.masksToBounds = true
        
    }

    


}
