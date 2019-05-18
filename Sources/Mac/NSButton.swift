import AppKit

public extension Container where Host: NSButton {

  func tap(_ action: @escaping Action) {
    let target = ButtonTarget(host: host, action: action)
    self.buttonTarget = target
  }
}

class ButtonTarget: NSObject {
  var action: Action?

  init(host: NSButton, action: @escaping Action) {
    super.init()

    self.action = action
    host.target = self
    host.action = #selector(handleTap)
  }

  // MARK: - Action

  @objc func handleTap() {
    action?()
  }
}
