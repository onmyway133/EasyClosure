//
//  EasyClosure
//
//  Created by khoa on 18/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import AppKit

public extension Container where Host: NSButton {

  func tap(_ action: @escaping Action) {
    let target = ButtonTarget(host: host, action: action)
    targets.append(target)
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
