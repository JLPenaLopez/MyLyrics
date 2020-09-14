//
//  DefaultLyricsHistoryRepository.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

final class DefaultLyricsHistoryRepository {
 
    private let dataTransferService: DataTransferService
    private let lyricHistoryStorage: LyricsHistoryStorage
    
    init(dataTransferService: DataTransferService, lyricHistoryStorage: LyricsHistoryStorage) {
        self.dataTransferService = dataTransferService
        self.lyricHistoryStorage = lyricHistoryStorage
    }
    
}

extension DefaultLyricsHistoryRepository: LyricsHistoryRepository {
    
    func fetchHistory(completion: @escaping (Result<[LyricQuery], Error>) -> Void) {
        self.lyricHistoryStorage.fetchHistory(completion: completion)
    }
    
}
