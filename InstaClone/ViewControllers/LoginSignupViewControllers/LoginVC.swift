//
//  LoginSignupViewController.swift
//  InstaClone
//
//  Created by Athena on 2/28/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit
import iOSDropDown
import Parse
import CoreData

class LoginVC: UIViewController {

    @IBOutlet var languageDropDown: DropDown!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var getHelpLabel: UILabel!
    @IBOutlet var switchPerspectiveButton: UIButton!
    @IBOutlet var fbSignupButton: UIButton!
    var users : [NSManagedObject]! = nil
    var loggedInUser : NSManagedObject? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginScreen()
        
    }
    

    // MARK: - Structural
    func setupLoginScreen() {
        createLangDropDown()
        CustomizationService.customizeTextField(textField: usernameTextField)
        CustomizationService.customizePlaceholderText(textField: usernameTextField, placeholderText: "Username")
        CustomizationService.customizeTextField(textField: passwordTextField)
        CustomizationService.customizePlaceholderText(textField: passwordTextField, placeholderText: "Password")
        CustomizationService.customizeButtons(button: loginButton)
       

    }
    
    
    func createLangDropDown(){
        languageDropDown.optionArray = ["English", "Spanish", "French"]
        
        // The Closure returns Selected Index and String
        languageDropDown.didSelect{(selectedText , index ,id) in
            print( "Selected String: \(selectedText) \n index: \(index)")
        }
        languageDropDown.backgroundColor = UIColor.clear
        languageDropDown.rowBackgroundColor = UIColor.clear
        languageDropDown.textColor = UIColor.white
        languageDropDown.borderColor = UIColor.clear
        languageDropDown.selectedRowColor = UIColor.white
        languageDropDown.rowHeight = 20
        
        var dropDownTitle = NSMutableAttributedString()
        let dropDownStr = "Language"
        dropDownTitle = NSMutableAttributedString(string: dropDownStr, attributes: nil)
        dropDownTitle.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: dropDownStr.count))
        languageDropDown.attributedPlaceholder = dropDownTitle
        languageDropDown.layer.borderColor = UIColor.clear.cgColor

    }
 
    
    
    // MARK: - Navigational
    @IBAction func loginButtonTapped(_ sender: Any) {
        if usernameTextField.text == "" || passwordTextField.text == "" {
            AlertService.showAlertWithOkay(alertTitle: "Incomplete Fields", alertMsg: "Please make sure all fields are entered!")
        } else {
            PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!, block:{ (user, error) in
                
                //logged in
                if user != nil {
                    print("Login successful")

                    //ask if user wants to save log in

                    let alert = UIAlertController(title: "Save Login?", message: "Would you like to save your login information for the future?", preferredStyle: UIAlertController.Style.alert)

                    alert.addAction( UIAlertAction(title: "Yes", style: .default, handler: { (alert) in
                        print("user is saving login")
                        self.saveLoginInfo(username: user![Constants.USERNAME]! as! String, saveLogin: true)
                         // perform segue
                        self.headToHomeVC()
                    }))

                    alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (alert) in
                        print("user is not saving login")
                        self.saveLoginInfo(username: user![Constants.USERNAME]! as! String, saveLogin: false)
                        // perform segue
                        self.headToHomeVC()
                    }))
                    self.present(alert, animated: true, completion: nil)
                    
                    
                } else{
                    var errorText = "Unknown error. Please try again."
                    if let error = error {
                        errorText = error.localizedDescription
                    }
                    AlertService.showAlertWithOkay(alertTitle: "Could Not Log You In", alertMsg: errorText)
                }
            })
        }
    }
    
    
    func saveLoginInfo(username: String, saveLogin: Bool) {
        
        // Get user
        let user = UserService.getUserByUsername(username: username)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Use the context variable to access core data
        let context = appDelegate.persistentContainer.viewContext
        
        // Set all user info
        let newUser = NSEntityDescription.insertNewObject(forEntityName: Constants.USER_ENTITY_NAME, into: context)
        newUser.setValue(user[Constants.USERNAME], forKey: Constants.USER_ENTITY_UNAME)
        newUser.setValue(saveLogin, forKey: Constants.USER_ENTITY_SAVELOG)
        
        do {
            try context.save()
            print("Saved login info context")
            
        } catch {
            print("There was an error...")
        }
        
        
        
    }
    
    
    func headToHomeVC(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.present(homeVC, animated:true, completion:nil)
    }
}
