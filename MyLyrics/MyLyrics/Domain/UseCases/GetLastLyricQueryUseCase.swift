//
//  GetLastLyricQueryUseCase.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 15/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

protocol GetLastLyricQueryUseCase {
    func execute(completion: @escaping (Result<LyricQuery?, Error>) -> Void)
}

//final class GetLastLyricQueryUseCase: GetLastLyricQueryableUseCase {
final class DefaultGetLastLyricQueryUseCase: GetLastLyricQueryUseCase {
    
    private let lyricsHistoryRepository: LyricsHistoryRepository
    
    
    init(lyricsHistoryRepository: LyricsHistoryRepository) {
        self.lyricsHistoryRepository = lyricsHistoryRepository
    }
    
    func execute(completion: @escaping (Result<LyricQuery?, Error>) -> Void) {
        lyricsHistoryRepository.getLastLyricQuery(completion: completion)
    }
    
}
