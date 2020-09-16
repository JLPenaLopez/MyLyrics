//
//  AppDelegate.swift
//  MyLyrics
//
//  Created by Jorge Luis Peña López on 12/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appDIContainer = AppDIContainer()    
    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let navigationBarApparence = UINavigationBar.appearance()
        navigationBarApparence.barTintColor = .accent
        navigationBarApparence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.background]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = AppCoordinator(window: window!, appDIContainer: appDIContainer)
        coordinator?.start()
        
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        LyricsCoreDataStorage.sharedInstance.saveContext()
    }
    
}

