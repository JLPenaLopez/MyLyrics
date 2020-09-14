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

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        //        guard let vc = storyboard.instantiateInitialViewController() as? TabViewController else {
//        guard let vc = storyboard.instantiateViewController(withIdentifier: "LyricHomeTabBarController") as? TabBarController else {
//
//            fatalError("Cannot instantiate initial view controller from storyboard with name ")
//        }
//
//        //        let vc = ViewController();
//        let navigation = UINavigationController(rootViewController: vc);
        window = UIWindow(frame: UIScreen.main.bounds);
//        window?.rootViewController = navigation;
//        window?.makeKeyAndVisible();
        coordinator = AppCoordinator(window: window!)
        coordinator?.start()
        
        return true
    }

}

