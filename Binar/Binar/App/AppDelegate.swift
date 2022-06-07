
//  AppDelegate.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 11/03/22.
//

import AVFoundation
import Firebase
import FirebaseCore
import GoogleSignIn
import IQKeyboardManagerSwift
import OneSignal
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        RemoteConfigHelper.standard.prepareValue()
        IQKeyboardManager.shared.enable = true
        
        OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
        OneSignal.initWithLaunchOptions(launchOptions)
        OneSignal.setAppId("68735e2b-2c61-4a1e-9ac0-63cd8a894aa1")
        OneSignal.promptForPushNotifications { accepted in
            print(">>> Accepted notifications: \(accepted)")
        }
        
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

