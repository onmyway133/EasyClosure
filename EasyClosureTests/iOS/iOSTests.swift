import XCTest
@testable import EasyClosure

class EasyClosureTests: XCTestCase {

    func testButton() {
        let button = UIButton()

        var called = false
        button.on.tap {
            called = true
        }

        button.sendActions(for: .touchUpInside)

        wait(for: 0.5)
        XCTAssertTrue(called)
    }
}
