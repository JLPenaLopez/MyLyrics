//
//  LyricDetailViewModel.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 15/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

protocol LyricDetailViewModelOutput {
    var error: Observable<String> { get }
    var loading: Observable<Bool> { get set }
    var songLyric: Observable<String> { get }
    var artist: String { get }
    var songTitle: String { get }
    var dateRequest: String { get }
    var lyricQuery: LyricQuery { get }
}

final class LyricDetailViewModel: LyricDetailViewModelOutput {
    
    private let getLyricUseCase: GetLyricUseCase
    
    var error: Observable<String> = Observable("")
    var loading: Observable<Bool> = Observable(false)
    var songLyric: Observable<String> = Observable("")
    var artist: String
    var songTitle: String
    var dateRequest: String
    var lyricQuery: LyricQuery
    
    let screenTitle = NSLocalizedString("lyric", comment: "")
    let errorTitle = NSLocalizedString("error", comment: "")
    
    init(lyricQuery: LyricQuery, getLyricUseCase: GetLyricUseCase) {
        self.lyricQuery = lyricQuery
        self.getLyricUseCase = getLyricUseCase
        self.songTitle = lyricQuery.title
        self.artist = lyricQuery.artist
        self.dateRequest = lyricQuery.dateRequest.getDateFormated()
    }
    
    func getLyric() {
        self.loading.value = true
        let searchLyricUseCaseRequestValue = SearchLyricUseCaseRequestValue(query: lyricQuery)
        
        getLyricUseCase.execute(requestValue: searchLyricUseCaseRequestValue) { (result) in
            
            switch result {
            case .success(let lyric):
                self.songLyric.value = lyric.lyrics ?? ""
            case .failure(let error):
                self.handleError(error: error)
            }
            self.loading.value = false
        }
    }
    
    private func handleError(error: Error) {
        self.error.value = error.isInternetConnectionError ?
            NSLocalizedString("noInternetConnection", comment: "") :
            NSLocalizedString("lyricNotFound", comment: "")
    }
}
