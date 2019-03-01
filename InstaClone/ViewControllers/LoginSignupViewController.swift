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
        
        
        languageDropDown.rowHeight = 25
    }
    


    
    // MARK: - Structural


}
