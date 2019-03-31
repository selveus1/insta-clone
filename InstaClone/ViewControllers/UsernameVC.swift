//
//  UsernameVC.swift
//  InstaClone
//
//  Created by Athena on 3/29/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit

class UsernameVC: UIViewController {

    
    var signupInfo: [String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(signupInfo.count > 0) {
            for (kind, value) in signupInfo {
                print("kind: \(kind), value: \(value)")
                
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
