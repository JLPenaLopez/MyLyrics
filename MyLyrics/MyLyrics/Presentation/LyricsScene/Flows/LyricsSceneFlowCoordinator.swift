//
//  LyricsSceneFlowCoordinator.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import UIKit

protocol LyricsSceneFlowCoordinatorDependences {
    func coordinateToLyricDetail(lyricQuery: LyricQuery)
}

final class LyricsSceneFlowCoordinator: Coordinator {

    var navigationController: UINavigationController
    private let appDIContainer: LyricsSceneDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: LyricsSceneDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        
        let vc = LyricHomeTabBarController.create()
        vc.coordinator = self
        vc.tabBar.tintColor = .accent
        
        let lyricSearchNavigationController = UINavigationController()
        let lyricSearchTabBarItem = UITabBarItem(title: NSLocalizedString("search", comment: ""), image: UIImage(named: "search"), tag: 0)
        lyricSearchTabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0)], for: .normal)

        lyricSearchNavigationController.tabBarItem = lyricSearchTabBarItem
        let lyricSearchCoordinator = LyricSearchCoordinator(navigationController: lyricSearchNavigationController,
                                                            appDIContainer: appDIContainer)
        
        let lyricHistoryNavigationController = UINavigationController()
        let lyricHistoryTabBarItem = UITabBarItem(title: NSLocalizedString("myLyrics", comment: ""), image: UIImage(named: "clock"), tag: 1)
        lyricHistoryTabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0)], for: .normal)
        
        lyricHistoryNavigationController.tabBarItem = lyricHistoryTabBarItem
        let lyricHistoryCoordinator = LyricHistoryCoordinator(navigationController: lyricHistoryNavigationController,
                                                              appDIContainer: appDIContainer)
        
        vc.viewControllers = [lyricSearchNavigationController, lyricHistoryNavigationController]
        vc.modalPresentationStyle = .overFullScreen
        navigationController.present(vc, animated: false, completion: nil)
        
        coordinate(to: lyricSearchCoordinator)
        coordinate(to: lyricHistoryCoordinator)
    }
    
}
