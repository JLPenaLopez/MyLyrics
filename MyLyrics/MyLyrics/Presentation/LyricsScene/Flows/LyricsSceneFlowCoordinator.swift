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

final class LyricsSceneFlowCoordinator: Coordinator, LyricsSceneFlowCoordinatorDependences {

    private let navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LyricHomeTabBarController.create()
        
        vc.coordinator = self
        
//        let historyNavigationController = UINavigationController()
//        let lyricHistoryCoordinator = LyricHistoryCoordinator(navigationController: historyNavigationController)
        
        navigationController?.pushViewController(vc, animated: false)
//        vc.modalPresentationStyle = .fullScreen
//        navigationController?.present(vc, animated: false, completion: nil)
        
//        coordinate(to: lyricHistoryCoordinator)
    }
    
    func coordinateToLyricDetail() {
        let coordinateToLyricDetail = LyricDetailCoordinator(navigationController: navigationController!)
        coordinate(to: coordinateToLyricDetail)
    }
}
