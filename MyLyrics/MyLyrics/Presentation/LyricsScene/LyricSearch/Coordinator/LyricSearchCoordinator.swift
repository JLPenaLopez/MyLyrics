//
//  LyricSearchCoordinator.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 14/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import UIKit

final class LyricSearchCoordinator: Coordinator, LyricsSceneFlowCoordinatorDependences {
    
    weak var navigationController: UINavigationController?
    private let appDIContainer: LyricsSceneDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: LyricsSceneDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let viewModel = LyricSearchViewModel(lyricSearchUseCase: appDIContainer.getSearchLyricUseCase(),
                                             lyricQueryLastUseCase: appDIContainer.getGetLastLyricQueryUseCase())
        let vc = LyricSearchViewController.create(with: viewModel)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func coordinateToLyricDetail(lyricQuery: LyricQuery) {
        let coordinateToLyricDetail = LyricDetailCoordinator(navigationController: navigationController!,
                                                             appDIContainer: appDIContainer,
                                                             lyricQuery: lyricQuery)
        coordinate(to: coordinateToLyricDetail)
    }
    
}

