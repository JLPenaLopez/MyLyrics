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
    
    init(lyricCoreDataStorage: LyricsCoreDataStorage) {
        self.lyricCoreDataStorage = lyricCoreDataStorage
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
}
