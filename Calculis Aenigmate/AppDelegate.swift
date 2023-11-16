//
//  AppDelegate.swift
//  Calculis Aenigmate
//
//  Created by Shohzod Rajabov on 02/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = HomeVC()
        let nav = UINavigationController(rootViewController: vc)
        setNavBar()
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func setNavBar() {
        let color = UIColor.Rang.zodiacGray
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = color
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else { }
    }

}

