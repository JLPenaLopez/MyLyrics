//
//  LyricHistoryViewController.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 12/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import UIKit

class LyricHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Storyboarded, AlertPresentable {

    @IBOutlet weak var tblViewLyrics: UITableView!
    
    var coordinator: LyricsSceneFlowCoordinatorDependences?
    var viewModel: LyricHistoryViewModel!
    
    static func create(with viewModel: LyricHistoryViewModel) -> LyricHistoryViewController {
        let view = LyricHistoryViewController.instantiate()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        binding(to: viewModel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
    }
    
    func configView() {
        title = viewModel.screenTitle
        tblViewLyrics.delegate = self
        tblViewLyrics.dataSource = self
        tblViewLyrics.tableFooterView = UIView()
        tblViewLyrics.separatorStyle = .singleLine
    }
    
    private func binding(to viewModel: LyricHistoryViewModel) {
        viewModel.lyricQuery.observe(on: self) { [weak self] in self?.showDetailCurrentLyricQuery($0) }
        viewModel.items.observe(on: self) { [weak self] _ in self?.tblViewLyrics.reloadData() }
        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0) }
        viewModel.error.observe(on: self) { [weak self] in self?.showError($0) }
    }
    
    private func loadData() {
        viewModel.getLyrics()
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
    
    private func showDetailCurrentLyricQuery(_ lyricQueryLast: LyricQuery?) {
        
        if let _ = lyricQueryLast {
            coordinator?.coordinateToLyricDetail(lyricQuery: lyricQueryLast!)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LyricTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? LyricTableViewCell else {
            return UITableViewCell();
        };
        
        cell.setup(with: viewModel.items.value[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath.row)
    }
    
}
