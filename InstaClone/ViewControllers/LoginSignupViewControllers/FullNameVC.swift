//
//  FullNamePasswordVC.swift
//  InstaClone
//
//  Created by Athena on 3/28/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit

class FullNameVC: UIViewController {


    var signupInfo: [String:String] = [:]
    @IBOutlet var fullNameTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(signupInfo.count > 0) {
            for (kind, value) in signupInfo {
                print("kind: \(kind), value: \(value)")
                
            }
        }
        
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        if(validateInput()) { //incorrect input of some kind
            
            self.signupInfo[Constants.FULL_NAME] = self.fullNameTextField.text
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let passwordVC = storyBoard.instantiateViewController(withIdentifier: "CreatePasswordVC") as! CreatePasswordVC
            passwordVC.signupInfo = signupInfo
            self.present(passwordVC, animated:true, completion:nil)
            
        }
        
    }
    
    
    func validateInput() -> Bool {
        //check if text field is empty
        if fullNameTextField.text == "" {
            AlertService.showAlertWithOkay(alertTitle: "Name Field Empty", alertMsg: "Please enter a name!")
            return false
        }
        
        return true
    }
    
}
