//
//  LyricSearchViewModel.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 15/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation

struct LyricSearchViewModelActions {
    let showLyricDetail: (LyricQuery) -> Void
}

protocol LyricSearchViewModelInput {
    func didSearch(artist: String, title: String)
    func getLastLyric()
}

protocol LyricSearchViewModelOutput {
    var error: Observable<String> { get }
    var loading: Observable<Bool> { get set }
    var lyricQuery: Observable<LyricQuery?> { get }
//    var isEmpty: Bool { get }
    var textTitleFormSearch: String { get }
    var textArtist: String { get }
    var textSongTitle: String { get }
    var textSearchLyric: String { get }
    var textTitleLastLyric: String { get }
    var textSearchDate: String { get }
}

final class LyricSearchViewModel: LyricSearchViewModelInput, LyricSearchViewModelOutput {
    
    private let lyricSearchUseCase: SearchLyricUseCase
    private let lyricQueryLastUseCase: GetLastLyricQueryUseCase
    private let actions: LyricSearchViewModelActions?
    
    var error: Observable<String> = Observable("")
    var loading: Observable<Bool> = Observable(false)
    var lyricQuery: Observable<LyricQuery?> = Observable(nil)
    var lyricQueryLast: Observable<LyricQuery?> = Observable(nil)
//    var isEmpty: Bool
    let screenTitle = NSLocalizedString("myLyrics", comment: "")
    let textTitleFormSearch = NSLocalizedString("searchLyric", comment: "")
    let textArtist = NSLocalizedString("artist", comment: "")
    let textSongTitle = NSLocalizedString("songTitle", comment: "")
    let textSearchLyric = NSLocalizedString("search", comment: "")
    let textTitleLastLyric = NSLocalizedString("lastLyricFound", comment: "")
    let textSearchDate = NSLocalizedString("searchDate", comment: "")
    let errorTitle = NSLocalizedString("error", comment: "")
    
    init(lyricSearchUseCase: SearchLyricUseCase,
         lyricQueryLastUseCase: GetLastLyricQueryUseCase,
         actions: LyricSearchViewModelActions? = nil) {
        self.lyricSearchUseCase = lyricSearchUseCase
        self.lyricQueryLastUseCase = lyricQueryLastUseCase
        self.actions = actions
    }
    
    func getLastLyric() {
        
        self.loading.value = true
        
        lyricQueryLastUseCase.execute { (result) in
            switch result {
            case .success(let lyricQuery):
                // TODO: Setear valor a un LyricQuery observable (toca declararlo) para que este en el viewController
                // lo reciba y con el coordinador llame el detalle, LyricSearchViewModelActions no me serviría
                self.lyricQueryLast.value = lyricQuery
            case .failure(let error):
                self.handleError(error: error)
            }
            self.loading.value = false
        }
    }
    
    func didSearch(artist: String, title: String) {
        load(lyricQuery: LyricQuery(artist: artist, title: title, dateRequest: Date()))
    }
    
    func load(lyricQuery: LyricQuery) {
        
        self.loading.value = true
        
        lyricSearchUseCase.execute(requestValue: .init(query: lyricQuery)) { (result) in
            
            switch result {
            case .success:
                self.lyricQueryLast.value = lyricQuery
                self.lyricQuery.value = lyricQuery
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
