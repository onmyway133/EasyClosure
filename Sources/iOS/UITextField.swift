//
//  EasyClosure
//
//  Created by khoa on 18/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public extension Container where Host: UITextField {

  func text(_ action: @escaping StringAction) {
    let target = TextFieldTarget(host: host, textAction: action)
    targets.append(target)
  }

  func didEndEditing(_ action: @escaping StringAction) {
    let target = TextFieldTarget(host: host, didEndEditingAction: action)
    targets.append(target)
  }
}

class TextFieldTarget: NSObject, UITextFieldDelegate {
  var didEndEditingAction: StringAction?
  var textAction: StringAction?

  required init(host: UITextField, didEndEditingAction: @escaping StringAction) {
    super.init()

    self.didEndEditingAction = didEndEditingAction
    host.delegate = self
  }

  required init(host: UITextField, textAction: @escaping StringAction) {
    super.init()

    self.textAction = textAction
    host.addTarget(self, action: #selector(handleTextChange(_:)), for: .editingChanged)
  }

  // MARK: - Action

  @objc func handleTextChange(_ textField: UITextField) {
    textAction?(textField.text ?? "")
  }

  // MARK: - UITextFieldDelegate

  @objc func textFieldDidEndEditing(_ textField: UITextField) {
    didEndEditingAction?(textField.text ?? "")
  }
}
