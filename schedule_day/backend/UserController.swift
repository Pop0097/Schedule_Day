//
//  UserController.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-21.
//

import Foundation
import SwiftUI
import Amplify

struct UserData {
    var id: String
    var name: String
    var email: String
    var username: String
}

class UserEntity: ObservableObject {
    static let shared : UserEntity = UserEntity()
    
    @Published var signedInUser : UserData = UserData(id: "", name: "", email: "", username: "")
    
    private init() {}
    
    func setUser(user: UserData) -> Void {
        signedInUser = user
    }
}

final class UserController {
    
    private var userEntity: UserEntity = UserEntity.shared
    
    func createUser(name: String, email: String, username: String, password: String) -> Void {
        let user = User(name: name, email: email, username: username, password: password)
        
        _ = Amplify.API.mutate(
            request: .create(user)
        )
        .resultPublisher
        .sink {
            if case let .failure(error) = $0 {
                print("Got failed event with error \(error)")
            }
        }
        receiveValue: { result in
            switch result {
            case .success(let user):
                print("Successfully created user: \(user)")
            
            case .failure(let error):
                print("Failed to create user: \(error)")
            }
        }
    }

    func getUser(username: String) -> Void {
        let user = User.keys
        let predicate = user.username == username
            
        _ = Amplify.API.query(
                request: .list(User.self, where: predicate)
            ) { [weak self] event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let user):
                    if (0 != user.count) {
                        print("Successfully retrieved user: \(user)")
                        DispatchQueue.main.async {
                            self?.userEntity.setUser(user: UserData(id: user[0].id, name: user[0].name, email: user[0].email, username: user[0].username))
                        }
                    } else {
                        print("No users found")
                    }

                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
}
