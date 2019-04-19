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
    

}
