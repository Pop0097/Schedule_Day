//
//  UserController.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-21.
//

import Foundation
import Amplify

struct UserData {
    var name: String
    var email: String
    var username: String
}

final class UserController: ObservableObject {
    
    @Published var signedInUser : UserData = UserData(name: "", email: "", username: "")
    
    func createUser(name: String, email: String, username: String, password: String) -> Void {
        let user = User(name: name, email: email, username: username, password: password)
        
        _ = Amplify.API.mutate(
            request: .create(user)
        ) { result in
            switch result {
            case .success(let user):
                print("Successfully created user: \(user)")
            
            case .failure(let error):
                print("Failed to create user: \(error)")
            }
        }
    }

    func getUser(email: String) -> Void {
//        _ = Amplify.API.query(request: .get(User.self, byEmail: email))
    }
}
