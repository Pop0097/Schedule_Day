// swiftlint:disable all
import Amplify
import Foundation

public struct User: Model {
  public let id: String
  public var name: String
  public var email: String
  public var username: String
  public var password: String
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      email: String,
      username: String,
      password: String) {
    self.init(id: id,
      name: name,
      email: email,
      username: username,
      password: password,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      email: String,
      username: String,
      password: String,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.email = email
      self.username = username
      self.password = password
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}