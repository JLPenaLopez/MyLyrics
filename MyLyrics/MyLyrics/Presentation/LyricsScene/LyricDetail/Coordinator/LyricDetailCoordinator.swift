//
//  LyricDetailCoordinator.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import UIKit

protocol LyricDetailFlow {
    func dismissDetail()
}

final class LyricDetailCoordinator: Coordinator, LyricDetailFlow {
    
    let navigationController: UINavigationController
    let lyricQuery: LyricQuery
    private let appDIContainer: LyricsSceneDIContainer
    
    init(navigationController: UINavigationController,
         appDIContainer: LyricsSceneDIContainer,
         lyricQuery: LyricQuery) {
        
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
        self.lyricQuery = lyricQuery
    }
    
    func start() {
        let viewModel = LyricDetailViewModel(lyricQuery: lyricQuery,
                                             getLyricUseCase: appDIContainer.getGetLyricUseCase())
        let vc = LyricDetailViewController.create(with: viewModel)
        navigationController.present(vc, animated: true, completion: nil)
    }

    func dismissDetail() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
