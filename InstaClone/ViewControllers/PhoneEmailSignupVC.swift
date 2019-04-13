//
//  PhoneEmailSignupVCViewController.swift
//  InstaClone
//
//  Created by Athena on 3/28/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit
import Parse

class PhoneEmailSignupVC: UIViewController {

    var signupInfo: [String:String] = [:]
    
    @IBOutlet var phoneEmailSegCtrl: UISegmentedControl!
    @IBOutlet var phoneEmailTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    var buttonBar = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // round button corners
        CustomizationService.roundButtonCorners(button: nextButton)
        
        // change segment control to bar theme
        self.view.addSubview(buttonBar)
        CustomizationService.customizeSegmentControl(segmentedControl: phoneEmailSegCtrl, buttonBar: buttonBar)

    }
    
    @IBAction func phoneEmailSegCtrlChanged(_ sender: Any) {
        
        // dismiss keyboard if showing
        phoneEmailTextField.resignFirstResponder()
        
        switch phoneEmailSegCtrl.selectedSegmentIndex
        {
        case 0:
            print("changing to phone keyboard type")
            phoneEmailTextField.placeholder = "Enter Phone Number"
            phoneEmailTextField.keyboardType = UIKeyboardType.phonePad
        case 1:
            print("changing to email keyboard type")
            phoneEmailTextField.placeholder = "Enter Email"
            phoneEmailTextField.keyboardType = UIKeyboardType.emailAddress

        default:
            break
        }
        
        phoneEmailTextField.text = ""
        
        // add keyboard if not showing
        phoneEmailTextField.becomeFirstResponder()
    }
    
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        
        
        
        if !validateInput() { //incorrect input of some kind
            AlertService.showAlertWithOkay(alertTitle: "Incorrect Phone / Email", alertMsg: "Please check to make sure input is valid.")
        } else {
            
            // check for username availibility
            var isPhone = true
            var errorTitle = ""
            if phoneEmailSegCtrl.selectedSegmentIndex == 0 {
                isPhone = true
                errorTitle = "Phone Number"
            } else {
                isPhone = false
                errorTitle = "Email"
            }
            
            if !UserService.checkPhoneEmailAvailability(isPhone: isPhone, inputText: phoneEmailTextField.text!) {
                
                AlertService.showAlertWithOkay(alertTitle: errorTitle + " Already In Use", alertMsg: errorTitle + " is already assigned to an account.")
            }
            else {
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                // add input for signup info dict
                if(phoneEmailSegCtrl.selectedSegmentIndex == 0) { //user is entering phone number
                    signupInfo[Constants.PHONE_NUMBER] = phoneEmailTextField.text
                    self.signupInfo[Constants.USERNAME] = ""
                    
                    // if user choose phone, send to username VC
                    let usernameVC = storyBoard.instantiateViewController(withIdentifier: "UsernameVC") as! UsernameVC
                    usernameVC.signupInfo = signupInfo
                    self.present(usernameVC, animated:true, completion:nil)
                    
                } else if(phoneEmailSegCtrl.selectedSegmentIndex == 1) { //user is entering
                    signupInfo["email"] = phoneEmailTextField.text
                    let usernameComponents = phoneEmailTextField.text!.components(separatedBy: "@")
                    self.signupInfo[Constants.USERNAME] = usernameComponents[0]
                    
                    // if user chooses email, send to add name VC
                    let fullNameVC = storyBoard.instantiateViewController(withIdentifier: "FullNameVC") as! FullNameVC
                    fullNameVC.signupInfo = signupInfo
                    self.present(fullNameVC, animated:true, completion:nil)
                }
                
            }
        }
        
    }
    
    
    func validateInput() -> Bool {
        
        //check if text field is empty
        if phoneEmailTextField.text == "" {
            return false;
        }
        
        if(phoneEmailSegCtrl.selectedSegmentIndex == 0) { //user is entering phone number
            
            do {
                try phoneEmailTextField.validatedText(validationType: ValidatorType.phoneNumber)
                
                // return UserService.checkPhoneEmailAvailability(isPhone: true, inputText: phoneEmailTextField.text!)
            } catch( _) {
                return false
            }
    
        } else if(phoneEmailSegCtrl.selectedSegmentIndex == 1) { //user is entering
            do {
                try phoneEmailTextField.validatedText(validationType: ValidatorType.email)
                //return UserService.checkPhoneEmailAvailability(isPhone: false, inputText: phoneEmailTextField.text!)
            } catch( _) {
                return false
            }
        }
        
        return true;
    }
    
    
}
