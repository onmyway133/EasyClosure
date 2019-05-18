import UIKit

public extension Container where Host: UIControl {

  func change(_ action: @escaping Action) {
    let target = ControlTarget(host: host, action: action)
    targets.append(target)
  }
}

class ControlTarget: NSObject {
  var action: Action?

  init(host: UIControl, action: @escaping Action) {
    super.init()

    self.action = action
    host.addTarget(self, action: #selector(handleChange(_:)), for: .valueChanged)
  }

  // MARK: - Action

  @objc func handleChange(_ control: UIControl) {
    action?()
  }
}

