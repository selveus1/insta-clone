//
//  \.swift
//  InstaClone
//
//  Created by Athena on 3/14/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import Foundation
import UIKit


class AlertService {
    
    static func showAlertWithOkay(alertTitle: String, alertMsg: String) -> Void{
        let alert = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    

    static func showImageAlertWithOkay(alertTitle: String, alertMsg: String, image: UIImage) -> Void {
        let alert = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: UIAlertController.Style.alert)
        
        let alertImgView = UIImageView(frame: CGRect(x: 220, y: 10, width: 100, height: 100))
        alertImgView.image = image
        alert.view.addSubview(alertImgView)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    
    

    
    static func sendImageAlertWithOkay(alertTitle: String, alertMsg: String, image: UIImage) -> UIAlertController {

//        let alert = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: UIAlertController.Style.alert)
//
//        let alertImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//        alertImgView.image = image
//        alert.view.addSubview(alertImgView)
//
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        return alert
        
        let alert = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "", style: .default, handler: nil)
        
        // size the image
//        let maxsize =  CGSize(width: 245, height: 300)
//        
//        let scaleSze = CGSize(width: 245, height: 245/image.size.width*image.size.height)
//        let reSizedImage = image.r
        
        alertAction.setValue(image.withRenderingMode(.alwaysOriginal), forKey: "image")
        alert.addAction(alertAction)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
        
    }
    
}


extension UIApplication {
    
    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
}
