//
//  UsernameVC.swift
//  InstaClone
//
//  Created by Athena on 3/29/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit
import Parse

class UsernameVC: UIViewController {

    var signupInfo: [String:String] = [:]
    @IBOutlet var usernameTextField: UITextField!

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Check if coming from WelcomeVC
        if signupInfo[Constants.USERNAME] != "" {
            usernameTextField.text = signupInfo[Constants.USERNAME]
        }
        
    }
    

    @IBAction func nextButtonTapped(_ sender: Any) {
        
        //if coming from WelcomeVC, no need to validate
        if signupInfo[Constants.USERNAME] != "" {
            
            if !UserService.isUsernameAvailable(username: usernameTextField.text!) {
                AlertService.showAlertWithOkay(alertTitle: "Username Already Exists", alertMsg: "That username has already been taken. Please choose another.")
            } else {
                
                //make the change
                var modInfo : [String: String] = [:]
                modInfo[Constants.USERNAME] = usernameTextField.text!
                if UserService.modifyUser(signupInfo: signupInfo, modInfo: modInfo) {
                    AlertService.showAlertWithOkay(alertTitle: "Success", alertMsg: " Username has been successfully changed.")
                    
                    // segue to init profile config
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let profilePhotoVC = storyBoard.instantiateViewController(withIdentifier: "ProfilePhotoVC") as! ProfilePhotoVC
                    profilePhotoVC.signupInfo = signupInfo
                    self.present(profilePhotoVC, animated:true, completion:nil)
                    
                } else {
                    AlertService.showAlertWithOkay(alertTitle: "Error", alertMsg: " Username could not be changed. Please try again.")
                }
            }
            
        } else { //new user so validate input
            if(validateInput()) { //incorrect input of some kind
                
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                // if signup info['username'] is empty, then it came from phoneVC
                if( (signupInfo[Constants.USERNAME]) == "") {
                    self.signupInfo[Constants.USERNAME] = self.usernameTextField.text
                    
                    let fullNameVC = storyBoard.instantiateViewController(withIdentifier: "FullNameVC") as! FullNameVC
                    fullNameVC.signupInfo = signupInfo
                    self.present(fullNameVC, animated:true, completion:nil)
                    
                } else {
                    
                    let profilePhotoVC = storyBoard.instantiateViewController(withIdentifier: "ProfilePhotoVC") as! ProfilePhotoVC
                    //initConfigVC.signupInfo = signupInfo
                    self.present(profilePhotoVC, animated:true, completion:nil)
                }
                
            }
        }
        
        
        
        
    }
    
    
    func validateInput() -> Bool {
        
        //check if text field is empty
        if usernameTextField.text == "" {
            AlertService.showAlertWithOkay(alertTitle: "Username Field Empty", alertMsg: "Please enter a valid username!")
            return false
        } else {
            do {
                //validate length of chars and types of chars
                try usernameTextField.validatedText(validationType: ValidatorType.username)
                
                // username has been taken
                if !UserService.isUsernameAvailable(username: usernameTextField.text!) {
                    AlertService.showAlertWithOkay(alertTitle: "Username Already Exists", alertMsg: "That username has already been taken. Please choose another.")
                    return false
                }

            } catch(let error) {
                AlertService.showAlertWithOkay(alertTitle: "Invalid Username", alertMsg: error.localizedDescription)
                return false
            }
        }
        
        return true
        
    }
    
    
    
    

}
