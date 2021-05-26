//
//  AppDelegate.swift
//  多种类型菜单
//
//  Created by student on 2021/5/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        additems()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate{
    func additems() {
        let items = UIApplicationShortcutItem(type: "type1", localizedTitle: "看一看", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(systemImageName: "qrcode.viewfinder"), userInfo: nil)
        
        let items2 = UIApplicationShortcutItem(type: "type2", localizedTitle: "扫一扫", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(systemImageName: "qrcode.viewfinder"), userInfo: nil)
        UIApplication.shared.shortcutItems = [items,items2]
    }
}
