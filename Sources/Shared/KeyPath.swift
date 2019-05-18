//
//  EasyClosure
//
//  Created by khoa on 18/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

public extension Container where Host: NSObject {

  func observe(object: NSObject, keyPath: String, _ action: @escaping AnyAction) {
    let item = KeyPathTarget.Item(object: object, keyPath: keyPath, action: action)
    keyPathTarget.items.append(item)
    object.addObserver(keyPathTarget, forKeyPath: keyPath, options: .new, context: nil)
  }

  func unobserve(object: NSObject, keyPath: String? = nil) {
    let predicate: (KeyPathTarget.Item) -> Bool = { item in
      return item.object === object
        && (keyPath != nil) ? (keyPath! == item.keyPath) : true
    }

    keyPathTarget.items.filter(predicate).forEach({
      object.removeObserver(keyPathTarget, forKeyPath: $0.keyPath)
    })

    keyPathTarget.items = keyPathTarget.items.filter({ !predicate($0) })
  }
}

class KeyPathTarget: NSObject {
  class Item {
    let object: NSObject
    let keyPath: String
    let action: AnyAction

    init(object: NSObject, keyPath: String, action: @escaping AnyAction) {
      self.object = object
      self.keyPath = keyPath
      self.action = action
    }
  }

  var items = [Item]()

  deinit {
    items.forEach({ item in
      item.object.removeObserver(self, forKeyPath: item.keyPath)
    })

    items.removeAll()
  }

  // MARK: - KVO

  override func observeValue(forKeyPath keyPath: String?,
                                    of object: Any?,
                                    change: [NSKeyValueChangeKey : Any]?,
                                    context: UnsafeMutableRawPointer?) {
    guard let object = object as? NSObject,
      let keyPath = keyPath,
      let value = change?[.newKey] else {
      return
    }

    let predicate: (KeyPathTarget.Item) -> Bool = { item in
      return item.object === object
        && keyPath == item.keyPath
    }

    items.filter(predicate).forEach({
      $0.action(value)
    })
  }
}
