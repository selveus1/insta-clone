//
//  UserService.swift
//  InstaClone
//
//  Created by Athena on 4/6/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import Foundation
import Parse


class UserService {
    
    let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y:0, width: 50, height: 50))
    
    
    static func createUser(signupInfo: [String:String]) -> Bool {
        print("creating user")
        let newUser = PFUser()
        newUser.username = signupInfo[Constants.USERNAME]
        newUser.password = signupInfo[Constants.PASSWORD]
        
        if signupInfo[Constants.EMAIL] != nil {
            newUser.email = signupInfo[Constants.EMAIL]
        } else{
            newUser[Constants.PHONE_NUMBER] = signupInfo[Constants.PHONE_NUMBER]
        }
        
        var createdUser = false
        do {
            try newUser.signUp()
            createdUser = true
        } catch(let error) {
            createdUser = false
        }

        print("done creating user")
        return createdUser
        
    }
    
    
    static func modifyUser(signupInfo: [String:String], modInfo: [String:String]) -> Bool {
    
        //var modUser = false
        let query = PFUser.query()
        query?.whereKey(Constants.USERNAME, equalTo: signupInfo[Constants.USERNAME]!)
        
        
        do {
            let users = try query?.findObjects()
            
            if users != nil {
 
                // there should only be one
                for user in users! {
                    for(key, value) in modInfo {
                        user[key] = value
                    }
                    
                    // save modifications
                    
                    do {
                        try user.save()
                    } catch(let error) {
                        return false
                    }
                    
//                    user.saveInBackground(block: { (isSuccess, error) in
//                        if error != nil {
//                            print(error)
//                            modUser = false
//                        } else {
//                            modUser = isSuccess
//                        }
//                    })
                }
                
            }
        } catch(let error) {
            return false
        }
        
        
//        query?.findObjectsInBackground(block: { (objects, error) in
//            if error != nil {
//                print(error!)
//                // although unknown error, give false just to be safe
//                modUser = false
//            }
//            else {
//                if let users = objects {
//
//                    // there should only be one
//                    for user in users {
//                        for(key, value) in modInfo {
//                            user[key] = value
//                        }
//
//                        // save modifications
//                        user.saveInBackground(block: { (isSuccess, error) in
//                            if error != nil {
//                                print(error)
//                                modUser = false
//                            } else {
//                                modUser = isSuccess
//                            }
//                        })
//                    }
//
//                }
//            }
//        })
    
        return true
    }
    
    static func checkUsernameAvailability(username: String) -> Bool {
        
        let query = PFUser.query()
        query?.whereKey(Constants.USERNAME, equalTo: username)
        
        do {
            let users = try query?.findObjects()
            
            if users?.count != 0 {
                return false
            }
        } catch(let error) {
            return false
        }
        
        return true
        
    }
    
    static func checkPhoneEmailAvailability(isPhone: Bool, inputText: String) -> Bool {
        let query = PFUser.query()
        var signupType = ""
        
        if(isPhone) {
            signupType = Constants.PHONE_NUMBER
        } else {
            signupType = Constants.EMAIL
        }
        
        query?.whereKey(signupType, equalTo: inputText)
        
        do {
            let users = try query?.findObjects()
            
            if users?.count != 0 {
                return false
            }
        } catch(let error) {
            return false
        }

        return true
    }
}
