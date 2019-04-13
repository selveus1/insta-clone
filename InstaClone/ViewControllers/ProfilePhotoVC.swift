//
//  FindFBFriendsVC.swift
//  InstaClone
//
//  Created by Athena on 3/28/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import UIKit

class ProfilePhotoVC: BaseImageViewController {

    var signupInfo: [String:String] = [:]

    @IBOutlet var addProfilePhotoButton: UIButton!
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var skipButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    

    @IBAction func addProfilePhotoButtonTapped(_ sender: Any) {
        
        //open action sheet for photos
        
        let actionSheet = UIAlertController(title: "Add Profile Photo",
                                            message: nil,
                                            preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let importFromFB = UIAlertAction(title: "Import From Facebook", style: .default) { (action) in
            print("importing from fb")
        }
        
        let takePhoto = UIAlertAction(title: "Take Photo", style: .default) { (action) in
            self.imageService.takePicture(self, imagePicker: self.imagePicker)
        }

        
        let choose = UIAlertAction(title: "Choose from Library", style: .default) { (action) in
            self.imageService.chooseFromGallery(self, imagePicker: self.imagePicker)
        }
        
        //attach actions to action sheet
        actionSheet.addAction(importFromFB)
        actionSheet.addAction(takePhoto)
        actionSheet.addAction(choose)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        imagePicker.dismiss(animated: true, completion: nil) //this dismisses the retake / use photo menu
        if let img = info[.originalImage] {

            self.image = (img as! UIImage)
            self.profileImg.image = img as? UIImage
            self.skipButton.setTitle("Next", for: .normal)
        }
        
        
    }
    
    
}
