//
//  SignupStartVC.swift
//  InstaClone
//
//  Created by Athena on 3/28/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit

class SignupStartVC: UIViewController {
    
    @IBOutlet var signupFBButton: UIButton!
    @IBOutlet var signupNonFBButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // round button corners
        CustomizationService.roundButtonCorners(button: signupFBButton)
        CustomizationService.roundButtonCorners(button: signupNonFBButton)
        
        //add fb logo to button
        signupFBButton.setImage(UIImage(named: "fb-white-icon"), for: .normal)
        signupFBButton.imageView?.contentMode = .scaleAspectFit

    }
    
    // TODO Add facebook signup here
    @IBAction func signupWithFBButtonTapped(_ sender: Any) {
    }
}
