//
//  ColorUtility.swift
//  QuotesApp
//
//  Created by Abhishek Dwivedi on 09/05/16.
//  Copyright © 2016 Abhishek Dwivedi. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func randomColor() -> UIColor {
        
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        let randomBlue = CGFloat(drand48())
        let randomAlpha = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue:randomBlue, alpha: randomAlpha)
    }
    
    static func randomLightColor() -> UIColor {
                
        return UIColor(red: 74/255.0, green: 144/255.0, blue:226/255.0, alpha: 0.2)
    }
}

extension UIImage {
    var circleMask: UIImage {
        let square = size.width < size.height ? CGSize(width: size.width, height: size.width) : CGSize(width: size.height, height: size.height)
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
        imageView.contentMode = UIViewContentMode.ScaleToFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.borderColor = UIColor.whiteColor().CGColor
        imageView.layer.borderWidth = 5
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContext(imageView.bounds.size)
        imageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}
