//
//  LyricResponseCoreDataStorage.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import CoreData

final class LyricResponseCoreDataStorage {
    
    private let lyricCoreDataStorage: LyricsCoreDataStorage
    
    init(lyricCoreDataStorage: LyricsCoreDataStorage = LyricsCoreDataStorage.sharedInstance) {
        self.lyricCoreDataStorage = lyricCoreDataStorage
    }
    
    private func fetchRequest(for requestDto: LyricRequestDTO) -> NSFetchRequest<LyricRequestEntity> {
        
        let request: NSFetchRequest = LyricRequestEntity.fetchRequest()
        
        request.predicate = NSPredicate(format: "%K = %@ AND %K = %d",
                                        #keyPath(LyricRequestEntity.artist), requestDto.artist,
                                        #keyPath(LyricRequestEntity.title), requestDto.title)
        return request
    }
    
    private func deleteResponse(for requestDto: LyricRequestDTO, in context: NSManagedObjectContext) {
        
        let request = fetchRequest(for: requestDto)
        
        do {
            if let result = try context.fetch(request).first {
                context.delete(result)
            }
        } catch {
            print("LyricResponseCoreDataStorage :: deleteResponse \(error)")
        }
    }
    
}

extension LyricResponseCoreDataStorage: LyricResponseStorage {
    
    func get(for requestDto: LyricRequestDTO, completion: @escaping (Result<LyricResponseDTO?, CoreDataStorageError>) -> Void) {
        
        lyricCoreDataStorage.performBackgroundTask { (context) in
            do {
                let fetchRequest = self.fetchRequest(for: requestDto)
                let requestEntity = try context.fetch(fetchRequest).first

                completion(.success(requestEntity?.response?.toDTO()))
            } catch {
                completion(.failure(CoreDataStorageError.fetchError(error)))
            }
        }
    }
    
    func save(for requestDto: LyricRequestDTO, responseDto: LyricResponseDTO) {
        
        lyricCoreDataStorage.performBackgroundTask { (context) in
            
            do {
                self.deleteResponse(for: requestDto, in: context)
                
                let requestEntity = requestDto.toEntity(in: context)
                requestEntity.response = responseDto.toEntity(in: context)

                try context.save()
            } catch {
                print("LyricResponseCoreDataStorage :: save Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
    
}
