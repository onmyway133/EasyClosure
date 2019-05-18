import Foundation

private struct AssociatedKey {
  static var key = "on"
}

public protocol EasyClosureAware: class {
  associatedtype EasyClosureAwareHostType: AnyObject

  var on: Container<EasyClosureAwareHostType> { get }
}

extension EasyClosureAware {
  public var on: Container<Self> {
    get {
      if let value = objc_getAssociatedObject(self, &AssociatedKey.key) as? Container<Self> {
        return value
      }

      let value = Container(host: self)
      objc_setAssociatedObject(self, &AssociatedKey.key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return value
    }
  }
}

extension NSObject: EasyClosureAware { }
