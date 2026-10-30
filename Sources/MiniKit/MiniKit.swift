import AppKit

open class Window: NSWindow {
    public weak var rootViewController: ViewController?

    public init(contentRect: NSRect = NSRect(x: 0, y: 0, width: 800, height: 600), styleMask: NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .resizable], backing: NSWindow.BackingStoreType = .buffered, defer flag: Bool = false) {
        super.init(contentRect: contentRect, styleMask: styleMask, backing: backing, defer: flag)
        title = "MiniKit"
    }

    public func setRootViewController(_ controller: ViewController) {
        rootViewController = controller
        controller.loadViewIfNeeded()
        contentView = controller.view
    }
}
