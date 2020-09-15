//
//  AppCoordinator.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
//        let vc = LyricHomeTabBarController.create()
        
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
//        let startCoordinator = StartCoordinator(navigationController: navigationController)
        let lyricsSceneFlowCoordinator = LyricsSceneFlowCoordinator(navigationController: navigationController)
        coordinate(to: lyricsSceneFlowCoordinator)
    }
}
