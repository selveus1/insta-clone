//
//  ViewController.swift
//  InstaClone
//
//  Created by Athena on 2/27/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //myMethod()
    }

    func myMethod() {
        var user = PFUser()
        user.username = "myUsername"
        user.password = "myPassword"
        user.email = "email@example.com"
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackground { (success, error) in
            if let error = error  {
                print(error)
                
            }else{
                print("sign up success")
                //self.performSegue(withIdentifier: "updateSegue", sender: nil)
            }
        }
    }

}

