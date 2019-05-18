import XCTest
import EasyClosure

class EasyClosureTests: XCTestCase {

    func testButton() {
        let button = UIButton()
        button.on.tap {}
    }
}
