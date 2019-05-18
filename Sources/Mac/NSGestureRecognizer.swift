//
//  NSGestureRecognizer.swift
//  EasyClosure-macOS
//
//  Created by khoa on 18/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import AppKit

public extension Container where Host: NSGestureRecognizer {
    func occur(_ action: @escaping Action) {
        let target = GestureTarget(host: host, action: action)
        targets[GestureTarget.uniqueId] = target
    }
}

class GestureTarget: NSObject {
    var action: Action?

    init(host: NSGestureRecognizer, action: @escaping Action) {
        super.init()

        host.action = #selector(didOccur(_:))
        host.target = self
    }

    // MARK: - Action

    @objc func didOccur(_ gestureRecognizer: NSGestureRecognizer) {
        action?()
    }
}
