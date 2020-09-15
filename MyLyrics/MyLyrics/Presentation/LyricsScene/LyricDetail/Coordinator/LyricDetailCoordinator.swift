//
//  LyricDetailCoordinator.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 13/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import Foundation
import UIKit

protocol LyricDetailFlow {
    func dismissDetail()
}

final class LyricDetailCoordinator: Coordinator, LyricDetailFlow {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LyricDetailViewController.create()
        navigationController.present(vc, animated: true, completion: nil)
    }

    func dismissDetail() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
