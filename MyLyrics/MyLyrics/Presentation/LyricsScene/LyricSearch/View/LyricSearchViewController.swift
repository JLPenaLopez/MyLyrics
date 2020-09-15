//
//  LyricSearchViewController.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 12/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import UIKit

class LyricSearchViewController: UIViewController, Storyboarded {

    var coordinator: LyricsSceneFlowCoordinatorDependences?
    
    static func create() -> LyricSearchViewController {
        let view = LyricSearchViewController.instantiate(name: "LyricHomeTabBarController")
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
