//
//  SaveLoginVC.swift
//  InstaClone
//
//  Created by Athena on 4/13/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit
import CoreData

class SaveLoginVC: UIViewController {
    
    var signupInfo: [String:String] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("savelogin vc")

    }
    
    
//    @IBAction func saveButtonTapped(_ sender: Any) {
//        saveContext(saveLogin: true)
//        headToHomeVC()
//    }
//
//
//
//    @IBAction func skipButtonTapped(_ sender: Any) {
//        saveContext(saveLogin: false)
//        headToHomeVC()
//
//    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        saveContext(saveLogin: true)
        headToHomeVC()
    }
    
    @IBAction func skipButtonTapped(_ sender: Any) {
        saveContext(saveLogin: false)
        headToHomeVC()
    }
    
    func saveContext(saveLogin: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Use the context variable to access core data
        let context = appDelegate.persistentContainer.viewContext
        
        // Set all user info
        let newUser = NSEntityDescription.insertNewObject(forEntityName: Constants.USER_ENTITY_NAME, into: context)
        newUser.setValue(signupInfo[Constants.USERNAME], forKey: Constants.USER_ENTITY_UNAME)
        newUser.setValue(true, forKey: Constants.USER_ENTITY_SAVELOG)
        
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
