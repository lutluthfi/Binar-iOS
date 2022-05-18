
//  AppDelegate.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 11/03/22.
//

import Firebase
import FirebaseCore
import IQKeyboardManagerSwift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        
        RemoteConfigHelper.standard.prepareValue()
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
    }
}

