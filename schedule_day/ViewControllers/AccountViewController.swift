//
//  AccountViewController.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-22.
//

import Foundation
import SwiftUI

struct AccountViewController: View {
    @EnvironmentObject var sessionManager : SessionManager
    
    @ObservedObject var userEntity : UserEntity = UserEntity.shared
        
    var body : some View {
        VStack {
            Text("Your Account")
                .font(.title)
            
            Divider()
            
            Spacer()
            
            VStack {
                HStack {
                    Text("Name:")
                    Text("\(userEntity.signedInUser.name)")
                }
                
                HStack {
                    Text("Email:")
                    Text("\(userEntity.signedInUser.email)")
                }
            }
            
            Spacer()
            
            Button(action: { sessionManager.signOut() }) {
                Text("Sign Out")
            }
            
            Spacer()
        }
    }
}
