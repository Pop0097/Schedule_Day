// swiftlint:disable all
import Amplify
import Foundation

extension Todo {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case userId
    case title
    case description
    case date
    case startTime
    case endTime
    case isCompleted
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let todo = Todo.keys
    
    model.pluralName = "Todos"
    
    model.fields(
      .id(),
      .field(todo.userId, is: .required, ofType: .string),
      .field(todo.title, is: .required, ofType: .string),
      .field(todo.description, is: .required, ofType: .string),
      .field(todo.date, is: .required, ofType: .string),
      .field(todo.startTime, is: .required, ofType: .string),
      .field(todo.endTime, is: .required, ofType: .string),
      .field(todo.isCompleted, is: .required, ofType: .bool),
      .field(todo.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(todo.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}