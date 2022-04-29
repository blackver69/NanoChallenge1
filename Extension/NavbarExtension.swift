//
//  NavbarExtension.swift
//  NanoChallenge1
//
//  Created by Ricky on 28/04/22.
//

import Foundation
import UIKit

extension UINavigationItem{
    func colourItem(){
        let col = Colour()
        self.rightBarButtonItem?.tintColor = col.hexStringToUIColor(hex: "FDAF75")
    
        
        
        
    }
    
}
