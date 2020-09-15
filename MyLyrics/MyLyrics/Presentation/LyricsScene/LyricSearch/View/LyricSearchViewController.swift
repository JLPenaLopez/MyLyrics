//
//  LyricSearchViewController.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 12/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import UIKit

class LyricSearchViewController: UIViewController, Storyboarded {
    
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
    @IBOutlet weak var lblDateSearch: UILabel!
    @IBOutlet weak var lblDateSearchValue: UILabel!
    
    
    var coordinator: LyricsSceneFlowCoordinatorDependences?
    
    static func create() -> LyricSearchViewController {
        let view = LyricSearchViewController.instantiate()
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        // Do any additional setup after loading the view.
    }
    
    
    func configView() {
        stackLastLyric.isHidden = true
        title = NSLocalizedString("myLyrics", comment: "")
        lblTitleFormSearch.text = NSLocalizedString("searchLyric", comment: "")
        txtArtist.placeholder = NSLocalizedString("artist", comment: "")
        txtSongTitle.placeholder = NSLocalizedString("songTitle", comment: "")
        btnSearchLyric.setTitle(NSLocalizedString("search", comment: ""), for: .normal)
        lblTitleLastLyric.text = NSLocalizedString("lastLyricFound", comment: "")
        lblSongTitle.text = NSLocalizedString("songTitle", comment: "")
        lblArtist.text = NSLocalizedString("artist", comment: "")
        lblDateSearch.text = NSLocalizedString("searchDate", comment: "")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onBtnSearchLyric(_ sender: Any) {
    }

    @IBAction func onBtnViewLastLyric(_ sender: Any) {
    }
    
    
    
}
