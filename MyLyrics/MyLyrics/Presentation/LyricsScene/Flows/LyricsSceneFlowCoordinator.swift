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
        
//        let historyNavigationController = UINavigationController()
//        let lyricHistoryCoordinator = LyricHistoryCoordinator(navigationController: historyNavigationController)
        
//        let topRatedNavigationController = UINavigationController()
//        topRatedNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
//        let topRatedCoordinator = TopRatedCoordinator(navigationController: topRatedNavigationController)
        
        let lyricSearchNavigationController = UINavigationController()
        lyricSearchNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let lyricSearchCoordinator = LyricSearchCoordinator(navigationController: lyricSearchNavigationController)
        
        let a = UITabBarItem(tabBarSystemItem: .history, tag: 1);
        a.title = "América"
        let b = UITabBarItem(title: NSLocalizedString("myLyrics", comment: ""), image: UIImage(named: "clock"), tag: 1)
        b.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0)], for: .normal)
        
        let lyricHistoryNavigationController = UINavigationController()
        lyricHistoryNavigationController.tabBarItem = b // UITabBarItem(tabBarSystemItem: .history, tag: 1)
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
