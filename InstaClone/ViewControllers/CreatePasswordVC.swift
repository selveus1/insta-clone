//
//  CreatePasswordVC.swift
//  InstaClone
//
//  Created by Athena on 3/29/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//


import UIKit
import Parse

class CreatePasswordVC: UIViewController {

    var signupInfo: [String:String] = [:]
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if(signupInfo.count > 0) {
            for (kind, value) in signupInfo {
                print("kind: \(kind), value: \(value)")
                
            }
        }
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        if(validateInput()) { //incorrect input of some kind
            
            self.signupInfo[Constants.PASSWORD] = self.passwordTextField.text
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let welcomeVC = storyBoard.instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeVC
            welcomeVC.signupInfo = signupInfo
            self.present(welcomeVC, animated:true, completion:nil)
            
        }
    }
    
    
    func validateInput() -> Bool {
        //check if text field is empty
        if passwordTextField.text == "" {
            AlertService.showAlertWithOkay(alertTitle: "Password Field Empty", alertMsg: "Please enter a passsword!")
            return false
        } else if passwordTextField.text!.count < 7 {
            AlertService.showAlertWithOkay(alertTitle: "Weak Password", alertMsg: "Please create a longer password")
            return false
            
        }
        
        return true
    }
    
    

}
