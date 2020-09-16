//
//  LyricHistoryViewModel.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 15/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

protocol LyricHistoryViewModelInput {
    func didSelectItem(at index: Int)
}

protocol LyricHistoryViewModelOutput {
    var items: Observable<[LyricHistoryItemViewModel]> { get }
    var error: Observable<String> { get }
    var loading: Observable<Bool> { get set }
    var lyricQuery: Observable<LyricQuery?> { get }
}

final class LyricHistoryViewModel: LyricHistoryViewModelInput, LyricHistoryViewModelOutput {
    
    private let lyricHistoryUseCase: LyricHistoryUseCase
    private var lyricQueries: [LyricQuery] = []
    
    var items: Observable<[LyricHistoryItemViewModel]> = Observable([])
    var error: Observable<String> = Observable("")
    var loading: Observable<Bool> = Observable(false)
    var lyricQuery: Observable<LyricQuery?> = Observable(nil)
    
    let screenTitle = NSLocalizedString("history", comment: "")
    let errorTitle = NSLocalizedString("error", comment: "")
    
    init(lyricHistoryUseCase: LyricHistoryUseCase) {
        self.lyricHistoryUseCase = lyricHistoryUseCase
    }
    
    func getLyrics() {
        
        self.loading.value = true
        
        lyricHistoryUseCase.execute { (result) in
            
            switch result {
            case .success(let items):
                self.lyricQueries = items
                self.items.value = items.map { $0 }.map(LyricHistoryItemViewModel.init)
            case .failure(let error):
                self.handleError(error: error)
            }
            self.loading.value = false
        }
    }
    
    private func handleError(error: Error) {
        self.error.value = error.isInternetConnectionError ?
            NSLocalizedString("noInternetConnection", comment: "") :
            NSLocalizedString("errorGettingLyrics", comment: "")
    }
    
    func didSelectItem(at index: Int) {
        self.lyricQuery.value = lyricQueries[index]
    }
}
