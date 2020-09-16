//
//  LyricSearchViewController.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 12/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import UIKit

class LyricSearchViewController: UIViewController, Storyboarded, AlertPresentable {
    
    @IBOutlet weak var lblTitleFormSearch: UILabel!
    @IBOutlet weak var txtArtist: UITextField!
    @IBOutlet weak var txtSongTitle: UITextField!
    @IBOutlet weak var btnSearchLyric: UIButton!
    
    @IBOutlet weak var stackLastLyric: UIStackView!
    @IBOutlet weak var lblTitleLastLyric: UILabel!
    @IBOutlet weak var lblSongTitle: UILabel!
    @IBOutlet weak var lblSongTitleValue: UILabel!
    @IBOutlet weak var lblArtist: UILabel!
    @IBOutlet weak var lblArtistValue: UILabel!
    @IBOutlet weak var lblSearchDate: UILabel!
    @IBOutlet weak var lblSearchDateValue: UILabel!
    
    var viewModel: LyricSearchViewModel!
    var coordinator: LyricsSceneFlowCoordinatorDependences?
    
    static func create(with viewModel: LyricSearchViewModel) -> LyricSearchViewController {
        let view = LyricSearchViewController.instantiate()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configHideKeyboard()
        configView()
        binding(to: viewModel)
        loadData()
    }
    
    func configView() {
        btnSearchLyric.isEnabled = false
        stackLastLyric.isHidden = true
        title = viewModel.screenTitle
        lblTitleFormSearch.text = viewModel.textTitleFormSearch
        txtArtist.placeholder = viewModel.textArtist
        txtSongTitle.placeholder = viewModel.textSongTitle
        btnSearchLyric.setTitle(viewModel.textSearchLyric, for: .normal)
        lblTitleLastLyric.text =  viewModel.textTitleLastLyric
        lblSongTitle.text = viewModel.textSongTitle
        lblArtist.text = viewModel.textArtist
        lblSearchDate.text = viewModel.textSearchDate
    }
    
    private func binding(to viewModel: LyricSearchViewModel) {
        viewModel.lyricQuery.observe(on: self) { [weak self] in self?.showDetailCurrentLyricQuery($0) }
        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0) }
        viewModel.lyricQueryLast.observe(on: self) { [weak self] in self?.updatelyricQueryLast($0) }
        viewModel.error.observe(on: self) { [weak self] in self?.showError($0) }
    }
    
    private func loadData() {
        viewModel.getLastLyric()
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
    
    private func updatelyricQueryLast(_ lyricQueryLast: LyricQuery?) {
        
        if let lyricQuery = lyricQueryLast {
            
            stackLastLyric.isHidden = false
            lblSongTitleValue.text = lyricQuery.title
            lblArtistValue.text = lyricQuery.artist
            lblSearchDateValue.text = lyricQuery.dateRequest.getDateFormated()
        } else {
            stackLastLyric.isHidden = true
        }
    }
    
    private func showDetailCurrentLyricQuery(_ lyricQueryLast: LyricQuery?) {
        
        if let _ = lyricQueryLast {
            coordinator?.coordinateToLyricDetail(lyricQuery: lyricQueryLast!)
        }
    }
    
    @IBAction func onTextFormEditingChange(_ sender: UITextField) {
        
        guard let artist = txtArtist.text, !artist.isEmpty,
            let title = txtSongTitle.text, !title.isEmpty
            else {
                btnSearchLyric.isEnabled = false
                return
        }
        btnSearchLyric.isEnabled = true
    }
    
    
    @IBAction func onBtnSearchLyric(_ sender: Any) {
        viewModel.didSearch(artist: txtArtist.text ?? "", title: txtSongTitle.text ?? "")
    }

    @IBAction func onBtnViewLastLyric(_ sender: Any) {
        coordinator?.coordinateToLyricDetail(lyricQuery: viewModel.lyricQueryLast.value!)
    }
    
}

extension LyricSearchViewController {
    
    func configHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
