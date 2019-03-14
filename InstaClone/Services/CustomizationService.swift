//
//  CustomizationService.swift
//  InstaClone
//
//  Created by Athena on 3/8/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import Foundation
import UIKit
import iOSDropDown

class CustomizationService {
    
    
    
    
    
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
    
    
    func customizeButtons(button: UIButton){
        button.layer.borderWidth = Constants.BORDER_WID
        button.layer.borderColor = Constants.LIGHT_OPAQUE.cgColor
        button.layer.cornerRadius = Constants.BORDER_RAD
    }
    
    
    // adds a small FB logo next to login with facebook text
    func customizeFacebookLabel(label: UILabel){

        let fbLogo: UIImage = UIImage(named: "FacebookLogoWhite")!
        var bgImg: UIImageView?
        bgImg = UIImageView(image: fbLogo)
        bgImg!.frame = CGRect(x: 0, y: 0, width: label.frame.height, height: label.frame.height)

        label.addSubview(bgImg!)
        label.textColor = .white
    }
    
}
