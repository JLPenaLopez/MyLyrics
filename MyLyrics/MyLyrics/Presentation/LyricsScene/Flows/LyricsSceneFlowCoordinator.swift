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
    func coordinateToLyricDetail()
}

//final class LyricsSceneFlowCoordinator: Coordinator, LyricsSceneFlowCoordinatorDependences {
final class LyricsSceneFlowCoordinator: Coordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LyricHomeTabBarController.create()
        
        vc.coordinator = self
        
//        vc.tabBar.barTintColor = .red
//        vc.tabBar.tintColor = .black
//        vc.tabBar.unselectedItemTintColor = .green
        
        vc.tabBar.tintColor = .accent
        
        let lyricSearchNavigationController = UINavigationController()
        let lyricSearchTabBarItem = UITabBarItem(title: NSLocalizedString("search", comment: ""), image: UIImage(named: "search"), tag: 0)
        lyricSearchTabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0)], for: .normal)

        lyricSearchNavigationController.tabBarItem = lyricSearchTabBarItem
//        lyricSearchNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let lyricSearchCoordinator = LyricSearchCoordinator(navigationController: lyricSearchNavigationController)
        
        let a = UITabBarItem(tabBarSystemItem: .history, tag: 1);
        a.title = "América"
        let lyricHistoryTabBarItem = UITabBarItem(title: NSLocalizedString("myLyrics", comment: ""), image: UIImage(named: "clock"), tag: 1)
        lyricHistoryTabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0)], for: .normal)
        let c = UITabBarItem(title: NSLocalizedString("myLyrics", comment: ""), image: UIImage(named: "clock"), selectedImage: UIImage(named: "clock"))
        c.tag = 1
        
        
        
        let lyricHistoryNavigationController = UINavigationController()
        lyricHistoryNavigationController.tabBarItem = lyricHistoryTabBarItem // UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let lyricHistoryCoordinator = LyricHistoryCoordinator(navigationController: lyricHistoryNavigationController)
        vc.viewControllers = [lyricSearchNavigationController, lyricHistoryNavigationController]
        
        vc.modalPresentationStyle = .overFullScreen
//        navigationController.pushViewController(vc, animated: false)
//        vc.modalPresentationStyle = .fullScreen
//        navigationController.setViewControllers([vc], animated: false)
//        navigationController = UINavigationController(rootViewController: vc)
//        navigationController.modalPresentationStyle = .fullScreen
        navigationController.present(vc, animated: false, completion: nil)
//        navigationController.present(vc, animated: false) {
//            self.coordinate(to: lyricSearchCoordinator)
//            self.coordinate(to: lyricHistoryCoordinator)
//        }
        coordinate(to: lyricSearchCoordinator)
        coordinate(to: lyricHistoryCoordinator)
    }
    
//    func coordinateToLyricDetail() {
//        let coordinateToLyricDetail = LyricDetailCoordinator(navigationController: navigationController!)
//        coordinate(to: coordinateToLyricDetail)
//    }
}
