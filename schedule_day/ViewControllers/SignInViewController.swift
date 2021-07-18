//
//  LoginViewController.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-18.
//

import Foundation
import SwiftUI

struct SignInViewController : View {
    
    @State var username : String = ""
    @State var password : String = ""
    
    var body: some View {
       
        NavigationView {
            VStack {
                Text("Schedule Day")
                    .font(.largeTitle)
                
                Text("By Pop0097")
                    .font(.subheadline)
                
                Divider()
                
                Text("Sign In")
                        .font(.title2)
                
                TextField("Username", text: $username)
                TextField("Password", text: $password)
                Button("Sign In") {}
                
                Spacer()
                
                NavigationLink(destination: SignUpViewController().navigationBarTitle("").navigationBarHidden(true)) {
                    Text("Sign Up")
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
    }
}

