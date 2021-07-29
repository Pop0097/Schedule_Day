//
//  TodoEntity.swift
//  schedule_day
//
//  Created by Dhruv Rawat on 2021-07-27.
//

import Foundation
import SwiftUI

struct TodoData: Identifiable {
    var id: String
    var userId: String
    var title: String
    var description: String
    var date: String
    var startTime: String
    var endTime: String
    var isCompleted: Bool
}

class TodoEntity: ObservableObject {
    static let shared: TodoEntity = TodoEntity()
    
    @Published var singleTodo: TodoData = TodoData(id: "", userId: "", title: "", description: "", date: "", startTime: "", endTime: "", isCompleted: false)
    
    @Published var listTodo: [TodoData] = []
    
    private init() {}
    
    func setSingleTodo(todo: TodoData) -> Void {
        singleTodo = todo
    }
    
    func setTodoList(todos: [TodoData]) -> Void {
        listTodo.removeAll()

        for todoItem in todos {
            listTodo.append(todoItem)
        }
    }
}
