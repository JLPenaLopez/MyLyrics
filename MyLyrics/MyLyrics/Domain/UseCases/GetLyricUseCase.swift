//
//  GetLyricUseCase.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

protocol GetLyricUseCase {
    func execute(requestValue: SearchLyricUseCaseRequestValue,
                 completion: @escaping (Result<Lyric, Error>) -> Void)
}

final class DefaultGetLyricUseCase: GetLyricUseCase {
    
    private let lyricRepository: LyricRepository
    private let lyricsHistoryRepository: LyricsHistoryRepository
    
    init(lyricRepository: LyricRepository, lyricsHistoryRepository: LyricsHistoryRepository) {
        self.lyricRepository = lyricRepository
        self.lyricsHistoryRepository = lyricsHistoryRepository
    }
    
    func execute(requestValue: SearchLyricUseCaseRequestValue, completion: @escaping (Result<Lyric, Error>) -> Void) {
 
        lyricRepository.getLyric(query: requestValue.query) { (result) in
            completion(result)
        }
    }
}
