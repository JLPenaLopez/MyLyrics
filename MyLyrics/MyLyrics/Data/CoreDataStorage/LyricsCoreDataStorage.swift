//
//  LyricsCoreDataStorage.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStorageError: Error {
    case saveError(Error)
    case fetchError(Error)
    case deleteError(Error)
}

final class LyricsCoreDataStorage {
    
    static let sharedInstance = LyricsCoreDataStorage()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "LyricsCoreDataStorage")
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                assertionFailure("LyricsCoreDataStorage Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    func saveContext() {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // TODO: - Log to Crashlytics
                assertionFailure("LyricsCoreDataStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
    
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        persistentContainer.performBackgroundTask(block)
    }
    
}
