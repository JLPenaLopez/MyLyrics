//
//  ProgressLoading.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import UIKit

class ProgressLoading {
    
    internal static var spinner: UIActivityIndicatorView?

    public static func show() {
        
        DispatchQueue.main.async {
            
            NotificationCenter.default.addObserver(self, selector: #selector(update),
                                                   name: UIDevice.orientationDidChangeNotification, object: nil)
            
            if spinner == nil, let window = UIApplication.shared.keyWindow {
                let frame = UIScreen.main.bounds
                let spinner = UIActivityIndicatorView(frame: frame)
                spinner.backgroundColor = UIColor.darkGray.withAlphaComponent(0.4)
                spinner.style = .whiteLarge
                window.addSubview(spinner)
                spinner.startAnimating()
                self.spinner = spinner
            }
        }
    }

    public static func hide() {
        
        DispatchQueue.main.async {
            
            guard let spinner = spinner else { return }
            
            spinner.stopAnimating()
            spinner.removeFromSuperview()
            self.spinner = nil
        }
    }

    @objc public static func update() {
        
        DispatchQueue.main.async {
            
            if spinner != nil {
                hide()
                show()
            }
        }
    }
}
