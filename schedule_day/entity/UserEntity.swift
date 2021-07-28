//
//  UserEntity.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-22.
//

import Foundation
import SwiftUI

struct UserData {
    var id: String
    var name: String
    var email: String
    var username: String
    var todoIds: [Todo]
}

class UserEntity: ObservableObject {
    static let shared : UserEntity = UserEntity()
    
    @Published var signedInUser : UserData = UserData(id: "", name: "", email: "", username: "", todoIds: [])
    
    private init() {}
    
    func setUser(user: UserData) -> Void {
        print("Hello there")
        signedInUser = user
    }
}
