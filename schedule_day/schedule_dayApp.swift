//
//  schedule_dayApp.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-14.
//

import Foundation
import SwiftUI
import Amplify
import AmplifyPlugins

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        do {
            Amplify.Logging.logLevel = .verbose
            
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            
            print("Amplify configured")
        } catch {
            print("An error occurred setting up Amplify: \(error)")
        }
        return true
    }
}

@main
struct MyAmplifyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

