//
//  UIColor.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 14/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(CFloat(r) / 0xff),
            green: CGFloat(CFloat(g) / 0xff),
            blue: CGFloat(Float(b) / 0xff), alpha: 1
        )
    }
    
    @objc class var Background: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "Background")!
        } else {
            return UIColor(hex: "F7FFF7")
        }
    }
    
}
