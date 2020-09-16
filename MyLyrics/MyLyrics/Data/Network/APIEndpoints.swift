//
//  APIEndpoints.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

struct APIEndpoints {
    
    static func getLyric(with lyricRequestDTO: LyricRequestDTO) -> Endpoint<LyricResponseDTO> {
        
        let artist = lyricRequestDTO.artist.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? lyricRequestDTO.artist
        let title = lyricRequestDTO.title.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? lyricRequestDTO.title
        
        let path = "v1/\(artist)/\(title)"
        
        return Endpoint(path: path, method: .get)
    }
}
