//
//  NSTextField.swift
//  EasyClosure-macOS
//
//  Created by khoa on 25/09/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(AppKit)

import AppKit

public extension Container where Host: NSTextField {
    func action(_ action: @escaping Action) {
        let target = TextFieldTarget(host: host, action: action)
        targets[TextFieldTarget.uniqueId] = target
    }

    func change(_ action: @escaping StringAction) {
        let target = TextFieldChangeTarget(host: host, action: action)
        targets[TextFieldChangeTarget.uniqueId] = target
    }
}

class TextFieldTarget: NSObject {
    var action: Action?

    init(host: NSTextField, action: @escaping Action) {
        super.init()

        self.action = action
        host.target = self
        host.action = #selector(handleAction(_:))
    }

    // MARK: - Action

    @objc func handleAction(_ sender: NSTextField) {
        action?()
    }
}

class TextFieldChangeTarget: NSObject, NSTextFieldDelegate {
    var action: StringAction?

    init(host: NSTextField, action: @escaping StringAction) {
        super.init()

        self.action = action
        host.delegate = self
    }

    // MARK: - Action

    func controlTextDidChange(_ obj: Notification) {
        let textField = obj.object as! NSTextField
        action?(textField.stringValue)
    }
}

#endif
