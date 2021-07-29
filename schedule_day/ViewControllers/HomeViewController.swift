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
    
    @EnvironmentObject var sessionManager: SessionManager
    
    @ObservedObject var userEntity: UserEntity = UserEntity.shared
    @ObservedObject var todoEntity: TodoEntity = TodoEntity.shared
        
    var body : some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(todoEntity.listTodo) { todo in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(todo.title)")
                                    .font(.title2)
                                Text("\(todo.startTime) - \(todo.endTime)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .layoutPriority(100)
                     
                            Spacer()
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.08), radius: 5, x: -5, y: -5)
                        .padding(.horizontal)
                        .padding(.top)
                    }
                }
            }.onAppear(perform: fetchTodos)
        }
    }
    
    private func fetchTodos() -> Void {
        if ("" != userEntity.signedInUser.id) {
            TodoController().getUserTodos(userId: userEntity.signedInUser.id)
        }
    }
}
