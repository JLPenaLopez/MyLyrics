//
//  LyricResponseEntity.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

extension LyricResponseEntity {
    
    func toDTO() -> LyricResponseDTO {
        return .init(lyrics: lyrics)
    }
}
