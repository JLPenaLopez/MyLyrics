//
//  LyricRequestDTO.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

struct LyricRequestDTO: Encodable {
    let artist: String
    let title: String
}
