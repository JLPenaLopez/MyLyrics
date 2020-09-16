//
//  LyricHistoryUseCase.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

protocol LyricHistoryUseCase {
    func execute(completion: @escaping (Result<[LyricQuery], Error>) -> Void)
}

final class DefaultLyricHistoryUseCase: LyricHistoryUseCase {
    
    private let lyricHistoryRepository: LyricsHistoryRepository
    
    init(lyricHistoryRepository: LyricsHistoryRepository) {
        self.lyricHistoryRepository = lyricHistoryRepository
    }
    
    func execute(completion: @escaping (Result<[LyricQuery], Error>) -> Void) {
        lyricHistoryRepository.fetchHistory(completion: completion)
    }
}
