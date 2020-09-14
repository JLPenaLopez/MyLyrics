//
//  LyricHistoryUseCase.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

final class LyricHistoryUseCase: UseCase {
    
    typealias ResultValue = (Result<[LyricQuery], Error>)
    
    private let completion: (ResultValue) -> Void
    private let lyricHistoryRepository: LyricsHistoryRepository
    
    init(lyricHistoryRepository: LyricsHistoryRepository, completion: @escaping (ResultValue) -> Void) {
        self.lyricHistoryRepository = lyricHistoryRepository
        self.completion = completion
    }
    
    func start() {
        lyricHistoryRepository.fetchHistory(completion: completion)
    }
}
