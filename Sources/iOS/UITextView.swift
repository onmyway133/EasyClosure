//
//  EasyClosure
//
//  Created by khoa on 18/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public extension Container where Host: UITextView {

    func text(_ action: @escaping StringAction) {
        let target = TextViewTarget(host: host, action: action)
        targets.append(target)
    }
}

class TextViewTarget: NSObject, UITextViewDelegate {
    var action: StringAction?

    init(host: UITextView, action: @escaping StringAction) {
        super.init()

        self.action = action
        host.delegate = self
    }

    // MARK: - UITextViewDelegate

    func textViewDidChange(_ textView: UITextView) {
        action?(textView.text ?? "")
    }
}
