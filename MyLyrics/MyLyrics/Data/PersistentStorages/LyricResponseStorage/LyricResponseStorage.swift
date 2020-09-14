//
//  LyricResponseStorage.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

protocol LyricResponseStorage {
    func get(for requestDto: LyricRequestDTO, completion: @escaping (Result<LyricResponseDTO?, CoreDataStorageError>) -> Void)
    func save(for requestDto: LyricRequestDTO, responseDto: LyricResponseDTO)
}
