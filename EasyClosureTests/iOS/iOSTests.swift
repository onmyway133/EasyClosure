#if canImport(UIKit) && os(iOS)

import XCTest
import EasyClosure
import UIKit

class EasyClosureTests: XCTestCase {

    func testButton() {
        let button = UIButton()
        button.on.tap {}
    }
}

#endif
