//
//  UIImageExtension.swift
//  NanoChallenge1
//
//  Created by Ricky on 27/04/22.
//

import Foundation
import UIKit


extension UIImageView{
    
    func drawARoundedCorner() {
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
}
