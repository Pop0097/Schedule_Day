//
//  Home.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-18.
//

import Foundation
import SwiftUI
import Amplify

struct Home : View {
    
    @EnvironmentObject var sessionManager : SessionManager
    
    @ObservedObject var userEntity : UserEntity = UserEntity.shared
        
    var body : some View {
        Text("Home: \(userEntity.signedInUser.username) | \(userEntity.signedInUser.email) | \(userEntity.signedInUser.name)")
        
        Button(action: { sessionManager.signOut() }) {
            Text("Sign Out")
        }
    }
}
