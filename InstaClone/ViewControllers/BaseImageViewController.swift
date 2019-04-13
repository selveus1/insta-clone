//
//  BaseImageViewController.swift
//  InstaClone
//
//  Created by Athena on 4/13/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit

class BaseImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagePicker: UIImagePickerController!
    var imageService: ImageService! = nil
    var image: UIImage! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageService = ImageService()
        print("init image service in base image vc")
        imagePicker = UIImagePickerController()
    }
    
    /*
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        print("doing stuff after taking pic")
        imagePicker.dismiss(animated: true, completion: nil) //this dismisses the retake / use photo menu
        if let img = info[.originalImage] {
            
            print("int img = info")
            self.image = (img as! UIImage)
            
            let alert = AlertService.sendImageAlertWithOkay(alertTitle: "Profile Picture Chose", alertMsg: "", image: img as! UIImage)
            
            UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
            
        } else {
            print("somethingi happeing with info")
        }
        
        
        print("end")
    }
 */

}
