import AppKit

open class ViewController: NSObject {
    private var _view: View?

    public weak var navigationController: NavigationViewController?

    public var frame: NSRect {
        if let view = _view {
            return view.frame
        }
        return .zero
    }

    public var bounds: NSRect {
        if let view = _view {
            return view.bounds
        }
        return .zero
    }

    open var view: View {
        if _view == nil {
            loadView()
        }
        return _view ?? View(frame: .zero)
    }

    public override init() {
        super.init()
    }

    open func loadView() {
        _view = View(frame: .zero)
        _view?.autoresizingMask = [.width, .height]
        viewDidLoad()
    }

    open func viewDidLoad() {
    }

    open func viewWillAppear(_ animated: Bool) {
    }

    open func viewDidAppear(_ animated: Bool) {
    }

    open func viewWillDisappear(_ animated: Bool) {
    }

    open func viewDidDisappear(_ animated: Bool) {
    }

    public func loadViewIfNeeded() {
        if _view == nil {
            loadView()
        }
    }

    open var window: Window? {
        return _view?.window as? Window
    }
}
