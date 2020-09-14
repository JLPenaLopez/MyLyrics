//
//  LyricsHistoryRepository.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

protocol LyricsHistoryRepository {
    func fetchHistory(completion: @escaping (Result<[LyricQuery], Error>) -> Void)
//    func saveLyric(lyric: Lyric, completion: @escaping (Result<[Lyric], Error>) -> Void)
//    func getLastLyric(completion: @escaping (Result<Lyric, Error>) -> Void)
}