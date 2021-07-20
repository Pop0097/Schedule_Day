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
    
    let user: AuthUser
    
    var body : some View {
        Text("Home: \(user.username)")
        
        Button(action: { sessionManager.signOut() }) {
            Text("Sign Out")
        }
    }
}
