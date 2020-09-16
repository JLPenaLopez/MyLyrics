//
//  AppDIContainer.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 15/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

final class AppDIContainer {
    
    lazy var appConfiguration = AppConfiguration()
    
    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.apiBaseURL)!)
        
        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    
    // MARK: - DIContainers of scenes
    func getLyricsSceneDIContainer() -> LyricsSceneDIContainer {
        let dependencies = LyricsSceneDIContainer.Dependencies(apiDataTransferService: apiDataTransferService)
        return LyricsSceneDIContainer(dependencies: dependencies)
    }
    
}
