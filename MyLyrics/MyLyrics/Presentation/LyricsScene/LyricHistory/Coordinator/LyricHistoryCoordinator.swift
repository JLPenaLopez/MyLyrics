//
//  LyricHistoryCoordinator.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 14/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import UIKit


final class LyricHistoryCoordinator: Coordinator, LyricsSceneFlowCoordinatorDependences {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LyricHistoryViewController.create()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func coordinateToLyricDetail() {
        let coordinateToLyricDetail = LyricDetailCoordinator(navigationController: navigationController!)
        coordinate(to: coordinateToLyricDetail)
    }
    
}
