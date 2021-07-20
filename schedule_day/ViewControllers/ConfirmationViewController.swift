//
//  ConfirmationViewController.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-20.
//

import Foundation
import SwiftUI

struct ConfirmationView : View {
    
    @EnvironmentObject var sessionManager : SessionManager
    
    @State var confirmationCode = ""
    
    let username: String
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Username: \(username)")
                    .font(.headline)
                
                TextField("Confirmation Code", text: $confirmationCode)
                    .padding(.all)
                    .background(colorScheme == .dark ? Color(red: 19.0/255.0, green: 23.0/255.0, blue: 24.0/255.0, opacity: 1.0) : Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                    .cornerRadius(5.0)
            }
            .padding(.horizontal, 15)
            
            Button(action: { sessionManager.confirmSignUp(for: username, with: confirmationCode )}) {
                Text("Confirm")
            }
        }
        .padding()
    }
}


