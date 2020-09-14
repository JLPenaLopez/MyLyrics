//
//  LyricHomeTabBarController.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 12/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import UIKit

class LyricHomeTabBarController: UITabBarController, Storyboarded {
    
    var coordinator: LyricsSceneFlowCoordinator?
    
    static func create() -> LyricHomeTabBarController {
        let view = LyricHomeTabBarController.instantiate()
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

