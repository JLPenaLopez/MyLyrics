//
//  LyricHistoryItemViewModel.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 15/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

struct LyricHistoryItemViewModel {
    let songTitle: String
    let artist: String
    let dateRequest: String
}

extension LyricHistoryItemViewModel {
    
    init(lyricQuery: LyricQuery) {
        self.songTitle = lyricQuery.title
        self.artist = lyricQuery.artist
        self.dateRequest = lyricQuery.dateRequest.getDateFormated()
    }
}
