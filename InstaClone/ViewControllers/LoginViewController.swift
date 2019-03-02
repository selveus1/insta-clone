//
//  LoginSignupViewController.swift
//  InstaClone
//
//  Created by Athena on 2/28/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit
import iOSDropDown

class LoginViewController: UIViewController {

    @IBOutlet var languageDropDown: DropDown!
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginSignupButton: UIButton!
    @IBOutlet var getHelpLabel: UILabel!
    
    @IBOutlet var loginWithFBLabel: UILabel!
    @IBOutlet var switchPerspectiveButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLoginScreen()
        
    }
    

    // MARK: - Structural
    func setupLoginScreen() {
        createLangDropDown()
        customizeTextField(textField: usernameTextField)
        customizePlaceholderText(textField: usernameTextField, placeholderText: "Username")
        customizeTextField(textField: passwordTextField)
        customizePlaceholderText(textField: passwordTextField, placeholderText: "Password")
        customizeButtons()
        customizeFacebookLabel()

    }
    
    
    func createLangDropDown(){
        languageDropDown.optionArray = ["English", "Spanish", "French"]
        
        // The the Closure returns Selected Index and String
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
    

    
    func customizePlaceholderText(textField: UITextField, placeholderText: String) {
        var fieldTextTitle = NSMutableAttributedString()
        fieldTextTitle = NSMutableAttributedString(string: placeholderText, attributes: nil)
        fieldTextTitle.addAttribute(NSAttributedString.Key.foregroundColor,
                                         value: UIColor.white, range:NSRange(location: 0, length: placeholderText.count))
        textField.attributedPlaceholder = fieldTextTitle
    }
    
    
    func customizeButtons(){
        loginSignupButton.layer.borderWidth = Constants.BORDER_WID
        loginSignupButton.layer.borderColor = Constants.LIGHT_OPAQUE.cgColor
        loginSignupButton.layer.cornerRadius = Constants.BORDER_RAD
    }
    
    
    // adds a small FB logo next to login with facebook text
    func customizeFacebookLabel(){
        
        let fbLogo: UIImage = UIImage(named: "FacebookLogoWhite")!
        var bgImg: UIImageView?
        bgImg = UIImageView(image: fbLogo)
        bgImg!.frame = CGRect(x: 0, y: 0, width: loginWithFBLabel.frame.height, height: loginWithFBLabel.frame.height)

        loginWithFBLabel.addSubview(bgImg!)
        loginWithFBLabel.textColor = .white
    }
    
    

}
