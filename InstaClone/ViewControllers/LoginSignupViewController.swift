//
//  LoginSignupViewController.swift
//  InstaClone
//
//  Created by Athena on 2/28/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit
import iOSDropDown

class LoginSignupViewController: UIViewController {

    @IBOutlet var languageDropDown: DropDown!
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginSignupButton: UIButton!
    @IBOutlet var getHelpLabel: UILabel!
    
    @IBOutlet var loginWithFBLabel: UILabel!
    @IBOutlet var switchPerspectiveButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        languageDropDown.optionArray = ["English", "Spanish", "French"]
        //Its Id Values and its optional
        //languageDropDown.optionIds = [1,23,54,22]
        // The the Closure returns Selected Index and String
        languageDropDown.didSelect{(selectedText , index ,id) in
            //self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
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
        dropDownTitle.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range:NSRange(location:0,length:dropDownStr.count))
        languageDropDown.attributedPlaceholder = dropDownTitle
        languageDropDown.layer.borderColor = UIColor.clear.cgColor
        
        
        usernameTextField.backgroundColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha:0.25)
        usernameTextField.textColor = .white
    
        //change placeholder text
        var mutableStringTitle = NSMutableAttributedString()
        let usernameString = "Username"
        
        mutableStringTitle = NSMutableAttributedString(string: usernameString, attributes: nil)
        mutableStringTitle.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range:NSRange(location:0,length:usernameString.count))
        usernameTextField.attributedPlaceholder = mutableStringTitle
        
        var passwordStringTitle = NSMutableAttributedString()
        let passwordString = "Password"
        passwordStringTitle = NSMutableAttributedString(string: passwordString, attributes: nil)
        passwordStringTitle.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range:NSRange(location:0,length:passwordString.count))
        passwordTextField.attributedPlaceholder = passwordStringTitle
        
        
    
        //pad text
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: usernameTextField.frame.height))
        usernameTextField.leftView = paddingView
        usernameTextField.leftViewMode = UITextField.ViewMode.always

        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        
        loginSignupButton.layer.borderWidth = 0.5
        loginSignupButton.layer.borderColor = UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha:0.25).cgColor
        
        
        //imbed img into fb label
        
//        let imgPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: loginWithFBLabel.frame.height + 5, height: loginWithFBLabel.frame.height))
//        loginWithFBLabel.addSubview(imgPaddingView)
        
        
        let fbLogo: UIImage = UIImage(named: "FacebookLogoWhite")!
        var bgImg: UIImageView?
        bgImg = UIImageView(image: fbLogo)
        bgImg!.frame = CGRect(x: 0, y: 0, width: loginWithFBLabel.frame.height, height: loginWithFBLabel.frame.height)
        
        loginWithFBLabel.addSubview(bgImg!)
        loginWithFBLabel.textColor = .white
        
        switchPerspectiveButton.backgroundColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha:0.25)
        
    }
    


    
    // MARK: - Structural


}
