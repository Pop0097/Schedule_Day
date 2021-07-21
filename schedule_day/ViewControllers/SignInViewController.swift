//
//  LoginViewController.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-18.
//

import Foundation
import SwiftUI
import Combine

struct SignInViewController : View {
    
    @EnvironmentObject var sessionManager : SessionManager
    
    @State var username : String = ""
    @State var password : String = ""
    
    @State var invalidInputs : Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    func verifyInputs() -> Bool {
        if "" == username || "" == password {
            return false
        }
        return true
    }
    
    func performSignin() {
        if verifyInputs() {
            sessionManager.signIn(username: username.capitalizingFirstLetter(), password: password)
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
                
                Text("Sign In")
                        .font(.title)
                                
                Group {
                    
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
                    
                    Button(action: {performSignin()}) {
                        HStack {
                            Spacer()
                            Text("Sign In")
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
                
                Button(action: { sessionManager.showSignUp() }) {
                    Text("Don't have an account? Sign Up")
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
    }
}

