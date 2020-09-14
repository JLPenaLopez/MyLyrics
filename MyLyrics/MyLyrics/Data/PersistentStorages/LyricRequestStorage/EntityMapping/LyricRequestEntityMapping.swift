//
//  LyricRequestEntityMapping.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import CoreData

extension LyricRequestEntity {
    convenience init(lyricQuery: LyricQuery, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        artist = lyricQuery.artist
        title = lyricQuery.title
        dateRequest = lyricQuery.dateRequest
    }
}

extension LyricRequestEntity {
    func toDomain() -> LyricQuery {
        return .init(artist: artist ?? "", title: title ?? "", dateRequest: dateRequest ?? Date())
    }
}

extension LyricRequestDTO {
    
    func toEntity(in context: NSManagedObjectContext) -> LyricRequestEntity {
        let entity: LyricRequestEntity = .init(context: context)
        entity.artist = artist
        entity.title = title
        return entity
    }
}
