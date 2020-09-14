//
//  LyricsHistoryStorage.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

protocol LyricsHistoryStorage {
    func fetchHistory(completion: @escaping (Result<[LyricQuery], Error>) -> Void)
}
