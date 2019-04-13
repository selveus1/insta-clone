//
//  ViewController.swift
//  InstaClone
//
//  Created by Athena on 2/27/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController {
    
    let customizationService = CustomizationService() // maybe make static for consistentcy
    
    let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y:0, width: 50, height: 50))
    
    @IBOutlet var mobileEmailField: UITextField!
    @IBOutlet var fullNameField: UITextField!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var signupButton: UIButton!
    @IBOutlet var signUpWithFBLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupSignUpScreen()
    }
    
    func setupSignUpScreen(){

//        customizationService.customizeTextField(textField: mobileEmailField)
//        customizationService.customizeTextField(textField: fullNameField)
//        customizationService.customizeTextField(textField: usernameField)
//        customizationService.customizeTextField(textField: passwordField)
//
//        customizationService.customizePlaceholderText(textField: mobileEmailField, placeholderText: "Mobile Number or Email")
//        customizationService.customizePlaceholderText(textField: fullNameField, placeholderText: "Full Name")
//        customizationService.customizePlaceholderText(textField: usernameField, placeholderText: "Username")
//        customizationService.customizePlaceholderText(textField: passwordField, placeholderText: "Password")
//
//        customizationService.customizeButtons(button: signupButton)
//        customizationService.customizeFacebookLabel(label: signUpWithFBLabel)
    }
    
    
    // adds color and padding to text fields
    func customizeTextField(textField: UITextField) {
        textField.backgroundColor = Constants.OPAQUE
        textField.textColor = .white
        
        //pad text
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: Constants.FIELD_HEIGHT))
        textField.leftView = paddingView
        textField.leftViewMode = UITextField.ViewMode.always
        textField.layer.cornerRadius = Constants.BORDER_RAD
        
    }


    func myMethod() {
        var user = PFUser()
        user.username = "myUsername"
        user.password = "myPassword"
        user.email = "email@example.com"
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackground { (success, error) in
            if let error = error  {
                print(error)
                
            }else{
                print("sign up success")
                //self.performSegue(withIdentifier: "updateSegue", sender: nil)
            }
        }
    }

    @IBAction func signupButtonTapped(_ sender: Any) {
        
        if mobileEmailField.text == "" || fullNameField.text == ""
            || usernameField.text == "" || passwordField.text == "" {
            AlertService.showAlertWithOkay(alertTitle: "Incomplete Fields", alertMsg: "Please make sure all fields are entered!")
        } else {
            
            

//                let emailPhone = try mobileEmailField.validatedText(validationType: ValidatorType.email)
//                let username = try usernameField.validatedText(validationType: ValidatorType.username)
//                let password = try passwordField.validatedText(validationType: ValidatorType.password)
            
            print("Validated fields!")
            
            let user = PFUser()
            user.username = usernameField.text
            
            if (mobileEmailField.text?.contains("@"))! {
                user.email = mobileEmailField.text
            } else {
                user["phoneNumber"] = mobileEmailField.text
            }
            
            user.password = passwordField.text
            
            user.signUpInBackground(block: { (success, error) in
                
                //stop pausing the app
                self.activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                if let error = error {
                    print(error)
                    AlertService.showAlertWithOkay(alertTitle: "Could Not Sign You Up", alertMsg: error.localizedDescription)
                } else {
                    print("signed up")
                    //self.performSegue(withIdentifier: "showUserTable", sender: self)
                }
                
            })
            
            
            
        }
        
    }
    
    func pauseApp(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
}

