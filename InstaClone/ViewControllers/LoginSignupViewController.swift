//
//  LoginSignupViewController.swift
//  InstaClone
//
//  Created by Athena on 2/28/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createGradientBackground()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Structural
    func createGradientBackground(){
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        layer.colors = [UIColor.purple.cgColor, UIColor.red.cgColor, UIColor.yellow.cgColor]
        layer.startPoint = CGPoint(x: 1, y: 0  )
        layer.endPoint = CGPoint(x: 0, y: 1)
        view.layer.addSublayer(layer)
    }

}
