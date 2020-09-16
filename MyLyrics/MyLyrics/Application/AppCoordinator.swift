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
    
    private let appDIContainer: AppDIContainer
    let window: UIWindow
    
    init(window: UIWindow, appDIContainer: AppDIContainer) {
        self.window = window
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let lyricSceneDIContainer = appDIContainer.getLyricsSceneDIContainer()
        let lyricsSceneFlowCoordinator = LyricsSceneFlowCoordinator(navigationController: navigationController,
                                                                    appDIContainer: lyricSceneDIContainer)
        coordinate(to: lyricsSceneFlowCoordinator)
    }
}
