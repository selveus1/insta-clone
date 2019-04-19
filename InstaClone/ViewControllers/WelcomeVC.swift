//
//  WelcomeUsernameVC.swift
//  InstaClone
//
//  Created by Athena on 3/28/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

/*
 
 This is the last view controller for uer configuration. Create the PFUser object here.
 If by chance that the use selected email and the username was set as their username, they
 can change it in the next screen
 
 */


import UIKit
import Parse

class WelcomeVC: UIViewController {

    var signupInfo: [String:String] = [:]
    @IBOutlet var welcomeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUser()
        
    }
    

    func createUser() {
        
        let didCreateUser = UserService.createUser(signupInfo: signupInfo)
        if(didCreateUser) { //successfully created user
            print("sign up success")
            self.welcomeLabel.text = "Welcome to Instagram, \(signupInfo[Constants.USERNAME] ?? "")!"
            
            
            
        } else {
            AlertService.showAlertWithOkay(alertTitle: "Error", alertMsg: "Error in creating new user. Please try Again")
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let signupStartVC = storyBoard.instantiateViewController(withIdentifier: "SignupStartVC") as! SignupStartVC
            self.present(signupStartVC, animated:true, completion:nil)
        }
        
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func changeUsernameButtonTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let usernameVC = storyBoard.instantiateViewController(withIdentifier: "UsernameVC") as! UsernameVC
        usernameVC.signupInfo = signupInfo
        self.present(usernameVC, animated:true, completion:nil)
    }
    

}
