//
//  LyricResponseEntityMapping.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import CoreData

extension LyricResponseDTO {
    
    func toEntity(in context: NSManagedObjectContext) -> LyricResponseEntity {
        let entity: LyricResponseEntity = .init(context: context)
        entity.lyrics = lyrics
        return entity
    }
}
