import UIKit

// MARK: - Singleton
let app = UIApplication.shared
// let app2 = UIApplication()


public class MySingleton {
  // 1
  static let shared = MySingleton()
  // 2
  private init() { }
}
// 3
let mySingleton = MySingleton.shared
// 4
// let mySingleton2 = MySingleton()


// MARK: - Singleton Plus
let defaultFileManager = FileManager.default
let customFileManager = FileManager()


public class MySingletonPlus {
  // 1
  static let shared = MySingletonPlus()
  // 2
  public init() { }
}
// 3
let singletonPlus = MySingletonPlus.shared

// 4
let singletonPlus2 = MySingletonPlus()

