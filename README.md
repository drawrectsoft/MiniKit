import AppKit
import XCTest
@testable import MiniKit

final class MiniKitTests: XCTestCase {
    func testWindowCanSetRootController() {
        let window = Window(contentRect: NSRect(x: 0, y: 0, width: 800, height: 600), styleMask: [.titled, .closable, .miniaturizable, .resizable])
        let root = ViewController()
        window.setRootViewController(root)

        XCTAssertTrue(window.rootViewController === root)
        XCTAssertTrue(window.contentView === root.view)
    }

    func testNavigationPushAndPop() {
        let nav = NavigationViewController(root: ViewController())
        let first = ViewController()
        let second = ViewController()

        nav.push(first)
        nav.push(second)

        XCTAssertEqual(nav.stack.count, 3)
        XCTAssertTrue(nav.topController === second)

        nav.pop()
        XCTAssertEqual(nav.stack.count, 2)
        XCTAssertTrue(nav.topController === first)
    }
}
