//
//  ContentView.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-14.
//

import SwiftUI

class UserData : ObservableObject {
    
    static let shared = UserData()
    
    @Published var isSignedIn : Bool = false
    
    private init() {}
}

struct ContentView: View {
    
    @ObservedObject private var userData : UserData = .shared
    
    var body: some View {
        if userData.isSignedIn {
            
        } else {
            SignInViewController()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
