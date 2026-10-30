import AppKit

open class NavigationViewController: ViewController {
    public private(set) var stack: [ViewController] = []

    public var topController: ViewController {
        return stack.last ?? emptyController
    }

    public let emptyController: ViewController

    public init(root controller: ViewController) {
        self.emptyController = controller
        super.init()
        stack = [controller]
        controller.navigationController = self
    }

    open override func loadView() {
        let content = View(frame: .zero)
        _ = content
        _view = content
    }

    open func push(_ controller: ViewController, animated: Bool = false) {
        controller.navigationController = self
        stack.append(controller)
        let target = self.view.bounds
        controller.view.frame = target
        if let content = _view {
            content.addSubview(controller.view)
        }
        controller.viewWillAppear(animated)
    }

    open func pop(animated: Bool = false) {
        guard stack.count > 1 else { return }
        let controller = stack.removeLast()
        controller.viewWillDisappear(animated)
        controller.view.removeFromSuperview()
        controller.viewDidDisappear(animated)
        topController.viewWillAppear(animated)
    }

    public func setRoot(_ controller: ViewController, animated: Bool = false) {
        for item in stack {
            item.view.removeFromSuperview()
        }
        stack = [controller]
        controller.navigationController = self
        let target = self.view.bounds
        controller.view.frame = target
        if let content = _view {
            content.addSubview(controller.view)
        }
        controller.viewWillAppear(animated)
    }
}
