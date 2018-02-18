//
//  AppDelegate.swift
//  xing
//
//  Created by Juan Landy on 18/2/18.
//  Copyright © 2018 Juan Landy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let screenBounds:CGRect = UIScreen.main.bounds
        self.window = UIWindow(frame: screenBounds)
        
        let viewController = MainViewController()
        viewController.view.backgroundColor = UIColor.lightGray
        let navigation = UINavigationController(rootViewController: viewController);
        
        self.window?.rootViewController = navigation;
        self.window?.makeKeyAndVisible();
        return true
    }

}

