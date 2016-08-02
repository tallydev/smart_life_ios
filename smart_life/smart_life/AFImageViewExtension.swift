//
//  AFImageViewExtension.swift
//  smart_life
//
//  Created by 张留刚 on 16/8/2.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

public extension UIImageView {
    
    /**
     Loads an image from a URL. If cached, the cached image is returned. Otherwise, a place holder is used until the image from web is returned by the closure.
     
     - Parameter url: The image URL.
     - Parameter placeholder: The placeholder image.
     - Parameter fadeIn: Weather the mage should fade in.
     - Parameter closure: Returns the image from the web the first time is fetched.
     
     - Returns A new image
     */
    func imageFromURL(url: String, placeholder: UIImage, fadeIn: Bool = true, shouldCacheImage: Bool = true, closure: ((image: UIImage?) -> ())? = nil)
    {
        self.image = UIImage.imageFromURL(url, placeholder: placeholder, shouldCacheImage: shouldCacheImage) {
            (image: UIImage?) in
            if image == nil {
                return
            }
            self.image = image
            if fadeIn {
                let transition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                transition.type = kCATransitionFade
                self.layer.addAnimation(transition, forKey: nil)
            }
            closure?(image:image)
        }
    }
    
    
}