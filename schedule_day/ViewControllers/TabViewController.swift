//
//  TabViewController.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-18.
//

import Foundation
import SwiftUI
import Amplify

struct TabViewController: View {
    
    @EnvironmentObject var sessionManager : SessionManager
    
    @ObservedObject var userEntity : UserEntity = UserEntity.shared
        
    var body : some View {
        TabView {
            HomeViewController()
                .tabItem {
                    Label("Home", systemImage: "list.dash")
                }
            
            CalendarViewController()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            
            AccountViewController()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
                .environmentObject(sessionManager)
            
            CreateTodoViewController()
                .tabItem {
                    Label("Create Todo", systemImage: "plus")
                }
        }
    }
}
