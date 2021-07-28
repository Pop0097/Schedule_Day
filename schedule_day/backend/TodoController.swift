//
//  TodoController.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-27.
//

import Foundation
import Amplify
import SwiftUI

final class TodoController {
    private var todoEntity: TodoEntity = TodoEntity.shared
    private var userEntity: UserEntity = UserEntity.shared
    
    func createTodo(userId: String, title: String, description: String, date: String, startTime: String, endTime: String) -> Void {
        
        let todo: Todo = Todo(userId: userEntity.signedInUser.id, title: title, description: description, date: date, startTime: startTime, endTime: endTime, isCompleted: false)
        
        _ = Amplify.API.mutate(
            request: .create(todo)
        )
        .resultPublisher
        .sink {
            if case let .failure(error) = $0 {
                print("Got failed event with error \(error)")
            }
        }
        receiveValue: { result in
            switch result {
            case .success(let todo):
                print("Successfully created todo: \(todo)")
            
            case .failure(let error):
                print("Failed to create todo: \(error)")
            }
        }
    }
    
    func getUserTodos(userId: String) -> Void {
        let todo = Todo.keys
        let predicate = todo.userId == userId
        
        _ = Amplify.API.query(
            request: .list(Todo.self, where: predicate)
        ) { [weak self] event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let todo):
                    if (0 > todo.count) {
                        print("Successfully retrieved todos: \(todo)")
                        
                        var todoList: [TodoData] = []
                        
                        for todoItem in todo {
                            todoList.append(TodoData(id: todoItem.id, userId: todoItem.userId, title: todoItem.title, description: todoItem.description, date: todoItem.date, startTime: todoItem.startTime, endTime: todoItem.endTime, isCompleted: todoItem.isCompleted))
                        }
                        
                        DispatchQueue.main.async {
                            self?.todoEntity.setListTodo(todos: todoList)
                        }
                    } else {
                        print("No todos found")
                    }

                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
}
