//
//  SignUpViewController.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-18.
//

import Foundation
import SwiftUI

struct SignUpViewController : View {
    
    @State var email : String = ""
    @State var name : String = ""
    @State var username : String = ""
    @State var password : String = ""
    @State var password_verify : String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Schedule Day")
                    .font(.largeTitle)
                
                Text("By Pop0097")
                    .font(.subheadline)
                
                Divider()
                
                Group {
                    TextField("Email", text: $email)
                    TextField("Name", text: $name)
                    TextField("Username", text: $username)
                    TextField("Password", text: $password)
                    TextField("Verify Password", text: $password_verify)
                    Button("Sign Up") {}
                }
                
                Spacer()
                
                NavigationLink(destination: SignInViewController().navigationBarTitle("").navigationBarHidden(true)) {
                    Text("Sign In")
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}
        

