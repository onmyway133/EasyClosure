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

    func testKeyPath() {
        let observer = NSObject()
        let label = UILabel()

        var text: String?
        observer.on.observe(object: label, keyPath: #keyPath(UILabel.text)) {
            text = $0 as? String
        }

        label.text = "hello"

        wait(for: 0.1)
        XCTAssertEqual(text, "hello")
        XCTAssertEqual(observer.on.keyPathTarget.items.count, 1)

        observer.on.unobserve(object: label)
        XCTAssertEqual(observer.on.keyPathTarget.items.count, 0)
    }

    func testNotification() {
        let observer = NSObject()

        var text: String?
        observer.on.observe(notification: Notification.Name("test")) {
            text = $0.userInfo?["key"] as? String
        }

        NotificationCenter.default.post(name: Notification.Name("test"), object: nil, userInfo: ["key": "value"])

        wait(for: 0.1)
        XCTAssertEqual(text, "value")

        XCTAssertEqual(observer.on.notificationTarget.mapping.count, 1)

        observer.on.unobserve(notification: Notification.Name("test"))
        XCTAssertEqual(observer.on.notificationTarget.mapping.count, 0)
    }
}
