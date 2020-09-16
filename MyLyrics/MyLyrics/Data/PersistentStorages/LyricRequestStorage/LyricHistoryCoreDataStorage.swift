//
//  LyricHistoryCoreDataStorage.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import CoreData

final class LyricHistoryCoreDataStorage {
    
    private let lyricCoreDataStorage: LyricsCoreDataStorage
    
    init(lyricCoreDataStorage: LyricsCoreDataStorage = LyricsCoreDataStorage.sharedInstance) {
        self.lyricCoreDataStorage = lyricCoreDataStorage
    }
    
    private func fetchLast() -> NSFetchRequest<LyricRequestEntity> {
        let request: NSFetchRequest = LyricRequestEntity.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(LyricRequestEntity.dateRequest),
                                                    ascending: false)]
        request.fetchLimit = 1
        return request
    }
    
}

extension LyricHistoryCoreDataStorage: LyricsHistoryStorage {
    
    func fetchHistory(completion: @escaping (Result<[LyricQuery], Error>) -> Void) {
        lyricCoreDataStorage.performBackgroundTask { (context) in
            do {
                let request: NSFetchRequest = LyricRequestEntity.fetchRequest()
                request.sortDescriptors = [NSSortDescriptor(key: #keyPath(LyricRequestEntity.dateRequest),
                                                            ascending: false)]

                let result = try context.fetch(request).map { $0.toDomain() }

                completion(.success(result))
            } catch {
                completion(.failure(CoreDataStorageError.fetchError(error)))
            }
        }
    }
    
    func getLast(completion: @escaping (Result<LyricQuery?, Error>) -> Void) {
        
        lyricCoreDataStorage.performBackgroundTask { (context) in
            
            do {
                let fetchRequest = self.fetchLast()
                let requestEntity = try context.fetch(fetchRequest).first
                completion(.success(requestEntity?.toDomain()))
            } catch {
                completion(.failure(CoreDataStorageError.fetchError(error)))
            }
        }
    }
}
