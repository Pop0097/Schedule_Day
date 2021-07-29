//
//  CreateTodoViewController.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-28.
//

import Foundation
import SwiftUI
import Amplify

struct CreateTodoViewController: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    @ObservedObject var userEntity: UserEntity = UserEntity.shared
    
    @State var title: String = ""
    @State var description: String = ""
    @State var startTime: Date = Date()
    @State var endTime: Date = Date()
    
    @State var invalidInputs: Bool = false
    @State var todoCreated: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var tabSelection: Int
    
    func verifyInputs() -> Bool {
        if "" == title || endTime < startTime {
            return false
        }
        return true
    }
    
    func performCreation() {
        if verifyInputs() {
            
            // https://www.hackingwithswift.com/example-code/system/how-to-convert-dates-and-times-to-a-string-using-dateformatter
            
            let formatterTime = DateFormatter()
            formatterTime.timeStyle = .medium
            
            let startTimeString: String = formatterTime.string(from: startTime)
            let endTimeString: String = formatterTime.string(from: startTime)
            
            let formatterDay = DateFormatter()
            formatterDay.dateStyle = .short
            
            let date = formatterDay.string(from: startTime)
            
            TodoController().createTodo(userId: userEntity.signedInUser.id, title: title, description: description, date: date, startTime: startTimeString, endTime: endTimeString)
            self.invalidInputs = false
            self.todoCreated = true
            
            self.tabSelection = 1
        } else {
            self.invalidInputs = true
        }
    }
        
    var body : some View {
        VStack {
            Text("New Todo")
                .font(.title)
            
            Group {
                VStack(alignment: .leading) {
                    Text("Title")
                        .font(.headline)
                    
                    TextField("Give a brief title", text: $title)
                        .padding(.all)
                        .background(colorScheme == .dark ? Color(red: 19.0/255.0, green: 23.0/255.0, blue: 24.0/255.0, opacity: 1.0) : Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        .cornerRadius(5.0)
                }
                .padding(.horizontal, 15)
                
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.headline)
                    
                    TextField("Give an optional description for the task", text: $description)
                        .padding(.all)
                        .background(colorScheme == .dark ? Color(red: 19.0/255.0, green: 23.0/255.0, blue: 24.0/255.0, opacity: 1.0) : Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        .cornerRadius(5.0)
                }
                .padding(.horizontal, 15)
                
                VStack(alignment: .leading) {
                    Text("Start Time")
                        .font(.headline)
                    
                    DatePicker("Start time", selection: $startTime)
                        .padding(.all)
                        .background(colorScheme == .dark ? Color(red: 19.0/255.0, green: 23.0/255.0, blue: 24.0/255.0, opacity: 1.0) : Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        .cornerRadius(5.0)
                }
                .padding(.horizontal, 15)
                
                VStack(alignment: .leading) {
                    Text("End Time")
                        .font(.headline)
                    
                    DatePicker("End time", selection: $endTime)
                        .padding(.all)
                        .background(colorScheme == .dark ? Color(red: 19.0/255.0, green: 23.0/255.0, blue: 24.0/255.0, opacity: 1.0) : Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        .cornerRadius(5.0)
                }
                .padding(.horizontal, 15)
                
                Button(action: {performCreation()}) {
                    HStack {
                        Spacer()
                        Text("Create Todo")
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
        }
    }
}

