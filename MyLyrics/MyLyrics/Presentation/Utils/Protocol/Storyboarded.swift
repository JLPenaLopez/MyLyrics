//
//  Storyboarded.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate(_ bundle: Bundle?, name: String?) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate(_ bundle: Bundle? = nil, name: String? = nil) -> Self {
        
        let fullName = NSStringFromClass(self)
        let storyName: String?
        
        guard let className = fullName.components(separatedBy: ".").last else {
            fatalError("Cannot get name from class \(fullName)")
        }
        
        if let _ = name {
            storyName = name
        } else {
            storyName = className
        }
        
        let storyboard = UIStoryboard(name: storyName!, bundle: bundle)
        
//        guard let vc = storyboard.instantiateInitialViewController() as? Self else {
        guard let vc = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            
            fatalError("Cannot instantiate initial view controller \(Self.self) from storyboard with name \(fullName)")
        }
        return vc
    }
}
