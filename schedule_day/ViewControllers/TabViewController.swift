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
    
    @State private var tabSelection = 1
        
    var body : some View {
        TabView(selection: $tabSelection) {
            HomeViewController()
                .tabItem {
                    Label("Home", systemImage: "list.dash")
                }
                .tag(1)
            
            CalendarViewController()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
                .tag(2)
            
            AccountViewController()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
                .environmentObject(sessionManager)
                .tag(3)
            
            CreateTodoViewController(tabSelection: $tabSelection)
                .tabItem {
                    Label("Create Todo", systemImage: "plus")
                }
                .tag(4)
        }
    }
}
