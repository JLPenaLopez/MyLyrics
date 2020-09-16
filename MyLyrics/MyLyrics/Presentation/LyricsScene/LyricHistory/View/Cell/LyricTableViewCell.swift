//
//  LyricTableViewCell.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 15/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import UIKit

class LyricTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSongTitle: UILabel!
    @IBOutlet weak var lblArtist: UILabel!
    @IBOutlet weak var lblSearchDate: UILabel!
    
    private var viewModel: LyricHistoryItemViewModel!
    static let reuseIdentifier = String(describing: LyricTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with viewModel: LyricHistoryItemViewModel) {
        self.viewModel = viewModel
        lblSongTitle.text = viewModel.songTitle
        lblArtist.text = viewModel.artist
        lblSearchDate.text = viewModel.dateRequest
    }

}
