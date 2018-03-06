//
//  AppDelegate.swift
//  xing
//
//  Created by Juan Landy on 18/2/18.
//  Copyright © 2018 Juan Landy. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let screenBounds:CGRect = UIScreen.main.bounds
        window = UIWindow(frame: screenBounds)
        
        let viewController = MainViewController()
        viewController.view.backgroundColor = UIColor.lightGray
        let navigation = UINavigationController(rootViewController: viewController)
        
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
    
    //MARK: - CoreData
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

