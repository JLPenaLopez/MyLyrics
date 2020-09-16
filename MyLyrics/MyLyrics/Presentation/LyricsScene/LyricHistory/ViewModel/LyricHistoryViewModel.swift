//
//  LyricHistoryViewModel.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 15/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

protocol LyricHistoryViewModelOutput {
    var items: Observable<[LyricHistoryItemViewModel]> { get }
    var error: Observable<String> { get }
    var loading: Observable<Bool> { get set }
}

final class LyricHistoryViewModel {
    
    
    
}
