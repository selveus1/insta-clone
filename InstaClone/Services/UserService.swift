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
            print(error)
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
                        print(error)
                        return false
                    }
                    

                }
                
            }
        } catch(let error) {
            print(error)
            return false
        }

    
        return true
    }
    
    static func isUsernameAvailable(username: String) -> Bool {
        
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
    
    static func isPhoneEmailAvailable(isPhone: Bool, inputText: String) -> Bool {
        let query = PFUser.query()
        var signupType = ""
        
        if(isPhone) {
            signupType = Constants.PHONE_NUMBER
            print("signup is phone")
        } else {
            signupType = Constants.EMAIL
            print("signup is email")
        }
        
        query?.whereKey(signupType, equalTo: inputText)
        
        do {
            let users = try query?.findObjects()
            if users?.count != 0 {
                print("found user with \(signupType)")
                return false
            }
        } catch(let error) {
            print("ERROR - \(error.localizedDescription)")
            return false
        }

        return true
    }
    
    static func getUserByUsername(username: String) -> PFObject {
        
        var user: PFObject? = nil
        let query = PFUser.query()
        
        query?.whereKey(Constants.USERNAME, equalTo: username)
        
        do {
            let foundUser = try query?.findObjects()
            
            if foundUser?.count != 0 {
                user = foundUser![0]
            } else {
                print("cannot find user")
            }
        } catch(let error) {
            print(error)
        }
        
        return user!
    }
    
    
    static func addProfilePictureToUser(signupInfo: [String:String], profilePic: UIImage) -> Bool {
        
        //find user
        
        print("\(signupInfo[Constants.USERNAME])")
        
        let user = self.getUserByUsername(username: signupInfo[Constants.USERNAME]!) as! PFUser

        if let imageData = profilePic.jpegData(compressionQuality: 0.70) {

            // Add image field to user
            user[Constants.PROFILE_PICTURE] = PFFileObject(name: "image.png", data: imageData)

            user.saveInBackground()
            return true

        }

        return false
    }
}
