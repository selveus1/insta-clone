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
    
    
    // MARK : - General
    static func roundButtonCorners(button: UIButton){
        button.layer.cornerRadius = Constants.BORDER_RAD
    }
    
    static func customizeSegmentControl(segmentedControl: UISegmentedControl, buttonBar: UIView) {
        
        // This needs to be false since we are using auto layout constraints
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        // Add lines below selectedSegmentIndex
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .clear
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 20) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ], for: .normal)
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 20) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.black
            ], for: .selected)
        
        // TODO - fix slider
        
        //Create the button bar that appears under the seg control to highlight selection
        // This needs to be false since we are using auto layout constraints
//        buttonBar.translatesAutoresizingMaskIntoConstraints = false
//        buttonBar.backgroundColor = UIColor.black
//
//        // Constrain the top of the button bar to the bottom of the segmented control
//        buttonBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor).isActive = true
//        buttonBar.heightAnchor.constraint(equalToConstant: 3).isActive = true
//
//        // Constrain the button bar to the left side of the segmented control
//        buttonBar.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor).isActive = true
//
//        // Constrain the button bar to the width of the segmented control divided by the number of segments
//        buttonBar.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments)).isActive = true
    }
    
    
    
    
    // MARK : - Login Screen
    
    static func customizeTextField(textField: UITextField) {
        textField.backgroundColor = Constants.OPAQUE
        textField.textColor = .white
        
        //pad text
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: Constants.FIELD_HEIGHT))
        textField.leftView = paddingView
        textField.leftViewMode = UITextField.ViewMode.always
        textField.layer.cornerRadius = Constants.BORDER_RAD

    }
    
    
    
    static func customizePlaceholderText(textField: UITextField, placeholderText: String) {
        var fieldTextTitle = NSMutableAttributedString()
        fieldTextTitle = NSMutableAttributedString(string: placeholderText, attributes: nil)
        fieldTextTitle.addAttribute(NSAttributedString.Key.foregroundColor,
                                    value: UIColor.white, range:NSRange(location: 0, length: placeholderText.count))
        textField.attributedPlaceholder = fieldTextTitle
    }
    
    
    static func customizeButtons(button: UIButton){
        button.layer.borderWidth = Constants.BORDER_WID
        button.layer.borderColor = Constants.LIGHT_OPAQUE.cgColor
        button.layer.cornerRadius = Constants.BORDER_RAD
    }
    
    
    // adds a small FB logo next to login with facebook text
    static func customizeFacebookLabel(label: UILabel){

        let fbLogo: UIImage = UIImage(named: "FacebookLogoWhite")!
        var bgImg = UIImageView(image: fbLogo)
        bgImg.frame = CGRect(x: 0, y: 0, width: label.frame.height, height: label.frame.height)

        label.addSubview(bgImg)
        label.textColor = .white
    }
    
}
