// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "7fe84d440676000635ffeea2f8d6d056"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: User.self)
  }
}