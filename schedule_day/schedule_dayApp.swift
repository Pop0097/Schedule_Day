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

@main
struct MyAmplifyApp: App {
    
    @ObservedObject var sessionManager = SessionManager()
    
    init() {
        configureAmplify()
        
        sessionManager.getCurrentAuthUser()
    }

    var body: some Scene {
        WindowGroup {
            switch sessionManager.authState { 
            case .SignIn:
                SignInViewController()
                    .environmentObject(sessionManager) // Allows us to access sessionManager from each view
            
            case .SignUp:
                SignUpViewController()
                    .environmentObject(sessionManager)
            
            case .ConfirmCode(let username):
                ConfirmationView(username: username)
                    .environmentObject(sessionManager)
                
            case .Session(let user):
                Home(user: user)
                    .environmentObject(sessionManager)
            }
        }
    }
    
    private func configureAmplify() -> Void {
        do {
            Amplify.Logging.logLevel = .verbose
            
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            
            print("Amplify configured")
        } catch {
            print("An error occurred setting up Amplify: \(error)")
        }
    }
}

