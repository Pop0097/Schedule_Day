//
//  SignUpViewController.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-18.
//

import Foundation
import SwiftUI

struct SignUpViewController : View {
    
    @EnvironmentObject var sessionManager : SessionManager
    
    @State var email : String = ""
    @State var name : String = ""
    @State var username : String = ""
    @State var password : String = ""
    @State var password_verify : String = ""
    
    @State var invalidInputs : Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    func verifyInputs() -> Bool {
        if "" == email || "" == name || "" == username || "" == password || "" == password_verify || password != password_verify {
            return false
        }
        return true
    }
    
    func performSignup() {
        if verifyInputs() {
            sessionManager.signUp(username: username, password: password, email: email, name: name)
            self.invalidInputs = false
        } else {
            self.invalidInputs = true
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Schedule Day")
                    .font(.largeTitle)
                
                Text("By Pop0097")
                    .font(.subheadline)
                
                Divider()
                
                Spacer()
                
                Text("Sign Up")
                    .font(.title)
                
                Group {
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.headline)
                        
                        TextField("Fill in your email", text: $email)
                            .padding(.all)
                            .background(colorScheme == .dark ? Color(red: 19.0/255.0, green: 23.0/255.0, blue: 24.0/255.0, opacity: 1.0) : Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                            .cornerRadius(5.0)
                    }
                    .padding(.horizontal, 15)
                    
                    VStack(alignment: .leading) {
                        Text("Name")
                            .font(.headline)
                        
                        TextField("Fill in your name", text: $name)
                            .padding(.all)
                            .background(colorScheme == .dark ? Color(red: 19.0/255.0, green: 23.0/255.0, blue: 24.0/255.0, opacity: 1.0) : Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                            .cornerRadius(5.0)
                    }
                    .padding(.horizontal, 15)
                    
                    VStack(alignment: .leading) {
                        Text("Username")
                            .font(.headline)
                        
                        TextField("Fill in your username", text: $username)
                            .padding(.all)
                            .background(colorScheme == .dark ? Color(red: 19.0/255.0, green: 23.0/255.0, blue: 24.0/255.0, opacity: 1.0) : Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                            .cornerRadius(5.0)
                    }
                    .padding(.horizontal, 15)
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.headline)
                        
                        TextField("Fill in your password", text: $password)
                            .padding(.all)
                            .background(colorScheme == .dark ? Color(red: 19.0/255.0, green: 23.0/255.0, blue: 24.0/255.0, opacity: 1.0) : Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                            .cornerRadius(5.0)
                    }
                    .padding(.horizontal, 15)
                    
                    VStack(alignment: .leading) {
                        Text("Verify Password")
                            .font(.headline)
                        
                        TextField("Verify your password", text: $password_verify)
                            .padding(.all)
                            .background(colorScheme == .dark ? Color(red: 19.0/255.0, green: 23.0/255.0, blue: 24.0/255.0, opacity: 1.0) : Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                            .cornerRadius(5.0)
                    }
                    .padding(.horizontal, 15)
                    
                    Button(action: {performSignup()}) {
                        HStack {
                            Spacer()
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .padding(.vertical, 10.0)
                    .background(Color.red)
                    .cornerRadius(4.0)
                    .padding(.horizontal, 50)
                }
                
                
                if self.invalidInputs {
                    Text("Some of your inputs are invalid. Please double check them")
                        .padding(10.0)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                Button(action: { sessionManager.showSignIn() }) {
                    Text("Already have an account? Sign In")
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}
        

