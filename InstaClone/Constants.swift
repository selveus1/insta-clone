//
//  Constants.swift
//  InstaClone
//
//  Created by Athena on 2/28/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import Foundation
import UIKit


struct Constants {
    // MARK: - Instagram Colors
    static let BLUE = UIColor(red: 64.0/255, green: 93.0/255, blue: 230.0/255, alpha: 1.0)
    static let INDIGO = UIColor(red: 88.0/255, green: 81.0/255, blue: 219.0/255, alpha: 1.0)
    static let PURPLE = UIColor(red: 131.0/255, green: 58.0/255, blue: 180.0/255, alpha: 1.0)
    static let FUSCHIA = UIColor(red: 193.0/255, green: 53.0/255, blue: 132.0/255, alpha: 1.0)
    static let PINK = UIColor(red: 225.0/255, green: 48.0/255, blue: 108.0/255, alpha: 1.0)
    static let RED = UIColor(red: 253.0/255, green: 29.0/255, blue: 29.0/255, alpha: 1.0)
    static let REDORANGE = UIColor(red: 245.0/255, green: 96.0/255, blue: 64.0/255, alpha: 1.0)
    static let ORANGE = UIColor(red: 247.0/255, green: 119.0/255, blue: 55.0/255, alpha: 1.0)
    static let YELLOWORANGE = UIColor(red: 252.0/255, green: 175.0/255, blue: 69.0/255, alpha: 1.0)
    static let YELLOW = UIColor(red: 255.0/255, green: 220.0/255, blue: 128.0/255, alpha: 1.0)
    
    static var OPAQUE = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha:0.25)
    static var LIGHT_OPAQUE = UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha:0.25)
    
    // MARK: - Structural
    static var BORDER_RAD: CGFloat = 3.0
    static var BORDER_WID: CGFloat = 1.1
    static var FIELD_HEIGHT: CGFloat = 40.0

    
    
    // MARK: - Common Fields
    static let USERNAME = "username"
    static let PASSWORD = "password"
    static let EMAIL = "email"
    static let PHONE_NUMBER = "phoneNumber"
    static let FULL_NAME = "fullName"
    static let PROFILE_PICTURE = "profilePicture"
    
    // MARK: - Core Data Entities & Fields
    static let USER_ENTITY_NAME = "User"
    static let USER_ENTITY_UNAME = "username"
    static let USER_ENTITY_SAVELOG = "saveLogin"
    
    
    
}

