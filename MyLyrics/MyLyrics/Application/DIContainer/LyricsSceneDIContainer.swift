//
//  LyricsSceneDIContainer.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 15/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

final class LyricsSceneDIContainer {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Persistent Storage
    
    lazy var lyricResponseStorage: LyricResponseStorage = LyricResponseCoreDataStorage()
    lazy var lyricsHistoryStorage: LyricsHistoryStorage = LyricHistoryCoreDataStorage()
    
    // MARK: - Repositories
    
    func getLyricRespository() -> LyricRepository {
        return DefaultLyricRepository(dataTransferService: dependencies.apiDataTransferService,
                                      storage: lyricResponseStorage)
    }
    
    func getLyricsHistoryRepository() -> LyricsHistoryRepository {
        return DefaultLyricsHistoryRepository(dataTransferService: dependencies.apiDataTransferService,
                                              lyricHistoryStorage: lyricsHistoryStorage)
    }
        
    // MARK: - Use Cases
    
    func getSearchLyricUseCase() -> SearchLyricUseCase {
        return DefaultSearchLyricUseCase(lyricRepository: getLyricRespository(),
                                         lyricsHistoryRepository: getLyricsHistoryRepository())
    }
    
    func getGetLyricUseCase() -> GetLyricUseCase {
        return DefaultGetLyricUseCase(lyricRepository: getLyricRespository(),
                                      lyricsHistoryRepository: getLyricsHistoryRepository())
    }
    
    func getLyricHistoryUseCase() -> LyricHistoryUseCase {
        return DefaultLyricHistoryUseCase(lyricHistoryRepository: getLyricsHistoryRepository())
    }

    func getGetLastLyricQueryUseCase() -> GetLastLyricQueryUseCase {
        return DefaultGetLastLyricQueryUseCase(lyricsHistoryRepository: getLyricsHistoryRepository ())
    }
    
}
