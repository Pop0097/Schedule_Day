//
//  Authentication.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-18.
//

import Foundation
import SwiftUI
import Amplify
import Combine

enum AuthState {
    case SignUp
    case SignIn
    case ConfirmCode(username: String)
    case Session
}

// Need to publish value whe changes
final class SessionManager : ObservableObject {
    @Published var authState: AuthState = .SignIn
    
    private var userController = UserController()
    
    private var name : String = ""
    private var email : String = ""
    private var username : String = ""
    private var password : String = ""
    
    func getCurrentAuthUser() -> Void {
        if let user = Amplify.Auth.getCurrentUser() {
            userController.getUser(username: String(user.username).capitalizingFirstLetter()) // Capitalize first letter since the authUser appears to remove all capitalization
            
            authState = .Session
        } else {
            authState = .SignIn
        }
    }
 
    func showSignUp() -> Void {
        authState = .SignUp
    }
    
    func showSignIn() -> Void {
        authState = .SignIn
    }
    
    func signUp(username: String, password: String, email: String, name: String) -> Void {
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        
        _ = Amplify.Auth.signUp(
                username: username,
                password: password,
                options: options
        ) { [weak self] result in // [weak self] used so we can refer to self. without having any retain cycles
            switch result {
            case .success(let signUpResult):
                print("Sign up result:", signUpResult)
                
                switch signUpResult.nextStep {
                case .done:
                    print("Done Sign Up")
                
                case .confirmUser(let details, _):
                    print(details ?? "No details")
                    
                    self?.name = name
                    self?.email = email
                    self?.username = username
                    self?.password = password
                    
                    // Wrap in dispatch queue so thread is brought back to the main thread before moving
                    DispatchQueue.main.async {
                        self?.authState = .ConfirmCode(username: username)
                    }
                }
                
            case .failure(let error):
                print("Sign up error:", error)
            }
        }
    }
    
    public func confirmSignUp(for username: String, with confirmationCode: String) -> Void {
        _ = Amplify.Auth.confirmSignUp(
                for: username,
                confirmationCode: confirmationCode
        ) { [weak self] result in
            switch result {
            case .success(let confirmResult):
                print(confirmResult)
                
                if confirmResult.isSignupComplete {
                    self?.userController.createUser(name: (self?.name ?? ""), email: (self?.email ?? ""), username: (self?.username ?? ""), password: (self?.password ?? ""))
                    
                    DispatchQueue.main.async {
                        self?.showSignIn()
                    }
                }
 
            case .failure(let error):
                print("Failed to confirm code:", error)
            }
        }
    }
    
    public func signIn(username: String, password: String) -> Void {
        _ = Amplify.Auth.signIn(
            username: username,
            password: password
        ) { [weak self] result in
            switch result {
            case .success(let signInResult):
                if signInResult.isSignedIn {
                    DispatchQueue.main.async {
                        self?.getCurrentAuthUser()
                    }
                }
                
            case .failure(let error):
                print("Sign in error:", error)
            }
        }
            
    }
    
    public func signOut() {
        _ = Amplify.Auth.signOut { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    UserEntity.shared.setUser(user: UserData(id: "", name: "", email: "", username: ""))
                    self?.showSignIn()
                }
                
            case .failure(let error):
                print("Sign out failure:", error)
            }
        }
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
 
