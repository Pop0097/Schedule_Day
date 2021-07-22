//
//  HomeViewController.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-18.
//

import Foundation
import SwiftUI
import Amplify

struct HomeViewController: View {
    
    @EnvironmentObject var sessionManager : SessionManager
    
    @ObservedObject var userEntity : UserEntity = UserEntity.shared
        
    var body : some View {
        VStack {
            Text("Home: \(userEntity.signedInUser.username)")
        }
    }
}