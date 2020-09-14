//
//  DefaultLyricRepository.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

final class DefaultLyricRepository {
    
    private let dataTransferService: DataTransferService
    private let storage: LyricResponseStorage
    
    init(dataTransferService: DataTransferService, storage: LyricResponseStorage) {
        self.dataTransferService = dataTransferService
        self.storage = storage
    }
    
}

extension DefaultLyricRepository: LyricRepository {
    
    func fetchLyric(query: LyricQuery, completion: @escaping (Result<Lyric, Error>) -> Void) {
        
        let requestDTO = LyricRequestDTO(artist: query.artist, title: query.title)
        let endpoint = APIEndpoints.getLyric(with: requestDTO)
        
        self.dataTransferService.request(with: endpoint) { (result) in
            
            switch result {
            case .success(let responseDTO):
                self.storage.save(for: requestDTO, responseDto: responseDTO)
                completion(.success(responseDTO.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getLyric(query: LyricQuery, completion: @escaping (Result<Lyric, Error>) -> Void) {
        
        let requestDTO = LyricRequestDTO(artist: query.artist, title: query.title)
        
        storage.get(for: requestDTO) { (result) in
            
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO!.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
