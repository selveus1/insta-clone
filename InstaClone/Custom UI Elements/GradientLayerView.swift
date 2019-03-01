//
//  GradientLayer.swift
//  InstaClone
//
//  Created by Athena on 2/28/19.
//  Copyright © 2019 Sheena Elveus. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientLayerView: UIView {
    
    @IBInspectable var gradientColor1: UIColor = UIColor.clear {
        didSet{
            self.setGradient()
        }
    }
    
    @IBInspectable var gradientColor2: UIColor = UIColor.clear {
        didSet{
            self.setGradient()
        }
    }
    
    @IBInspectable var gradientStartPoint: CGPoint = .zero {
        didSet{
            self.setGradient()
        }
    }
    
    @IBInspectable var gradientEndPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet{
            self.setGradient()
        }
    }
    
    
    private func setGradient() {
        let layer = CAGradientLayer()
        layer.colors = [self.gradientColor1.cgColor, self.gradientColor2.cgColor]
        layer.startPoint = self.gradientStartPoint
        layer.endPoint = self.gradientEndPoint
        layer.frame = self.bounds
        self.layer.insertSublayer(layer, at: 0)
    }
    
}

