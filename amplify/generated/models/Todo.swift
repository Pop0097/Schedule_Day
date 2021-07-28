// swiftlint:disable all
import Amplify
import Foundation

public struct Todo: Model {
  public let id: String
  public var userId: String
  public var title: String
  public var description: String
  public var date: String
  public var startTime: String
  public var endTime: String
  public var isCompleted: Bool
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      userId: String,
      title: String,
      description: String,
      date: String,
      startTime: String,
      endTime: String,
      isCompleted: Bool) {
    self.init(id: id,
      userId: userId,
      title: title,
      description: description,
      date: date,
      startTime: startTime,
      endTime: endTime,
      isCompleted: isCompleted,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      userId: String,
      title: String,
      description: String,
      date: String,
      startTime: String,
      endTime: String,
      isCompleted: Bool,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.userId = userId
      self.title = title
      self.description = description
      self.date = date
      self.startTime = startTime
      self.endTime = endTime
      self.isCompleted = isCompleted
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}