//
//  LyricHistoryViewController.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 12/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import UIKit

class LyricHistoryViewController: UIViewController, Storyboarded {

    @IBOutlet weak var tblViewLyrics: UITableView!
    
    var coordinator: LyricsSceneFlowCoordinatorDependences?
    
    static func create() -> LyricHistoryViewController {
        let view = LyricHistoryViewController.instantiate()
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
//        binding(to: viewModel)
//        loadData()
    }
    
    func configView() {
        tblViewLyrics.tableFooterView = UIView();
        tblViewLyrics.separatorStyle = .singleLine;
    }
    

}
