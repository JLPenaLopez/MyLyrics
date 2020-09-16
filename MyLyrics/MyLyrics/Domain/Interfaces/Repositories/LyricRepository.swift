//
//  LyricRepository.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

protocol LyricRepository {
    func fetchLyric(query: LyricQuery, completion: @escaping (Result<Lyric, Error>) -> Void)
    func getLyric(query: LyricQuery, completion: @escaping (Result<Lyric, Error>) -> Void)    
}
