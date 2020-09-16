//
//  LyricResponseDTO.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

struct LyricResponseDTO: Decodable {
    let lyrics: String?
}

extension LyricResponseDTO {    
    func toDomain() -> Lyric {
        return .init(lyrics: lyrics)
    }
}
