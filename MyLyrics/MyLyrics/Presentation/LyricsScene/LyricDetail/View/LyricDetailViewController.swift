//
//  LyricDetailViewController.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import UIKit

class LyricDetailViewController: UIViewController, Storyboarded {

    @IBOutlet weak var lblDetail: UILabel!
    
    var coordinator: LyricDetailFlow?
    
    
    static func create() -> LyricDetailViewController {
        let view = LyricDetailViewController.instantiate()
        return view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("lyric", comment: "")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
