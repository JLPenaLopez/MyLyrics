//
//  SearchLyricUseCase.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

protocol SearchLyricUseCase {
    func execute(requestValue: SearchLyricUseCaseRequestValue,
                 completion: @escaping (Result<Lyric, Error>) -> Void)
}

final class DefaultSearchLyricUseCase: SearchLyricUseCase {
    
    private let lyricRepository: LyricRepository
    private let lyricsHistoryRepository: LyricsHistoryRepository
    
    init(lyricRepository: LyricRepository, lyricsHistoryRepository: LyricsHistoryRepository) {
        self.lyricRepository = lyricRepository
        self.lyricsHistoryRepository = lyricsHistoryRepository
    }
    
    func execute(requestValue: SearchLyricUseCaseRequestValue,
                 completion: @escaping (Result<Lyric, Error>) -> Void) {
        
        lyricRepository.fetchLyric(query: requestValue.query) { (result) in
            
//            if case .success(let lyric) = result {
//                print("DefaultSearchLyricUseCase :: execute \(lyric)")
//                // TODO: Ver si es necesario esta parte
////                self.lyricsHistoryRepository.saveLyric(lyric: lyric, completion: { _ in })
//            }
            completion(result)
        }
    }
}

struct SearchLyricUseCaseRequestValue {
    let query: LyricQuery
}
