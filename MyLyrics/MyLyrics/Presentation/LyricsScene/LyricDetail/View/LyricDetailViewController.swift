//
//  LyricDetailViewController.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import UIKit

class LyricDetailViewController: UIViewController, Storyboarded, AlertPresentable {

    @IBOutlet weak var lblSongTitle: UILabel!
    @IBOutlet weak var lblArtist: UILabel!
    @IBOutlet weak var lblSearchDate: UILabel!
    @IBOutlet weak var txtViewLyrics: UITextView!
    
    var coordinator: LyricDetailFlow?
    var viewModel: LyricDetailViewModel!
    
    static func create(with viewModel: LyricDetailViewModel) -> LyricDetailViewController {
        let view = LyricDetailViewController.instantiate()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
        binding(to: viewModel)
        loadData()
    }
    
    func configView() {
        title = viewModel.screenTitle
    }
    
    private func binding(to viewModel: LyricDetailViewModel) {
        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0) }
        viewModel.songLyric.observe(on: self) { [weak self] in self?.showLyric($0) }
        viewModel.error.observe(on: self) { [weak self] in self?.showError($0) }

    }

    private func loadData() {
        viewModel.getLyric()
    }
    
    private func updateLoading(_ isLoading: Bool) {
        if isLoading {
            ProgressLoading.show()
        } else {
            ProgressLoading.hide()
        }
    }
    
    private func showError(_ error: String) {
        guard !error.isEmpty else { return }
        showAlert(title: viewModel.errorTitle, message: error)
    }
    
    private func showLyric(_ lyrics: String) {
        
        lblSongTitle.text = viewModel.songTitle
        lblArtist.text = viewModel.artist
        lblSearchDate.text = viewModel.dateRequest
        txtViewLyrics.text = lyrics
    }
    
}
