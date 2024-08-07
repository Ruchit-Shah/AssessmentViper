//
//  AppDelegate.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let router = UniversityListRouter.start()
        let initialViewController = router.entry!
        
        let navigation = UINavigationController()
        navigation.viewControllers = [initialViewController]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
}

