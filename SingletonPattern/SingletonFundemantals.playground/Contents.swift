import UIKit

// MARK: - Singleton
let app = UIApplication.shared
// let app2 = UIApplication()


public class MySingleton {
  // Static Instance
  static let shared = MySingleton()
    
  // Mark init as private
  private init() { }
}

// Get instance
let mySingleton = MySingleton.shared

// Don't allow to create custom object
// let mySingleton2 = MySingleton()



// MARK: - Singleton Plus
let defaultFileManager = FileManager.default
let customFileManager = FileManager()


public class MySingletonPlus {
  // Static Instance
  static let shared = MySingletonPlus()
    
  // Marked as a public
  public init() { }
}
// Get static instance
let singletonPlus = MySingletonPlus.shared

// Get custom instance
let singletonPlus2 = MySingletonPlus()

