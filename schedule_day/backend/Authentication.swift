//
//  Authentication.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-18.
//

import Foundation
import Amplify
import Combine

class AuthenticationBackend {
    static let shared = AuthenticationBackend()
    
    private init() {}
    
    public func signUp(username: String, password: String, email: String) -> AnyCancellable {
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        let sink = Amplify.Auth.signUp(username: username, password: password, options: options)
            .resultPublisher
            .sink {
                if case let .failure(authError) = $0 {
                    print("An error occurred while registering a user \(authError)")
                }
            }
            receiveValue: { signUpResult in
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    print("Delivery details \(String(describing: deliveryDetails))")
                } else {
                    print("SignUp Complete")
                }

            }
        return sink
    }

    public func confirmSignUp(for username: String, with confirmationCode: String) -> AnyCancellable {
        Amplify.Auth.confirmSignUp(for: username, confirmationCode: confirmationCode)
            .resultPublisher
            .sink {
                if case let .failure(authError) = $0 {
                    print("An error occurred while confirming sign up \(authError)")
                }
            }
            receiveValue: { _ in
                print("Confirm signUp succeeded")
            }
    }

    public func signIn(username: String, password: String) -> AnyCancellable {
        Amplify.Auth.signIn(username: username, password: password)
            .resultPublisher
            .sink {
                if case let .failure(authError) = $0 {
                    print("Sign in failed \(authError)")
                }
            }
            receiveValue: { _ in
                print("Sign in succeeded")
            }
    }


}
