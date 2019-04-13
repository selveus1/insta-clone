//
//  ImageService.swift
//  InstaClone
//
//  Created by Athena on 4/13/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import Foundation
import UIKit


class ImageService { //NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    //var imagePicker: UIImagePickerController!
    var baseImgController: BaseImageViewController!
  
    
    func takePicture(_ controller: BaseImageViewController, imagePicker: UIImagePickerController ) {
        self.baseImgController = controller
        
        imagePicker.delegate = controller //self
        imagePicker.sourceType = .camera
        controller.present(imagePicker, animated: true, completion: nil)

        
    }
    
    func chooseFromGallery(_ controller: BaseImageViewController, imagePicker: UIImagePickerController ) {
        self.baseImgController = controller
        
        imagePicker.delegate = controller
        imagePicker.sourceType = .photoLibrary
        controller.present(imagePicker, animated: true, completion: nil)
        
    }
    
    
}
