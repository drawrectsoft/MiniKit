import AppKit

open class View: NSView {
    public var backgroundColor: NSColor = .clear {
        didSet {
            layer?.backgroundColor = backgroundColor.cgColor
        }
    }

    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }

    public init() {
        super.init(frame: .zero)
        commonInit()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        wantsLayer = true
        layer?.masksToBounds = false
        layer?.backgroundColor = backgroundColor.cgColor
        layerContentsRedrawPolicy = .onSetNeedsDisplay
        if #available(macOS 10.15, *) {
            layer?.cornerCurve = .continuous
        }
    }

    open override var isFlipped: Bool {
        return true
    }

    open func setNeedsDisplayLayer() {
        layer?.setNeedsDisplay()
    }

    public func change(position: NSPoint, animated: Bool = false, duration: Double = 0.2, completion: (() -> Void)? = nil) {
        if animated {
            NSAnimationContext.runAnimationGroup({ context in
                context.duration = duration
                context.timingFunction = CAMediaTimingFunction(name: .easeOut)
                self.animator().setFrameOrigin(position)
            }, completionHandler: completion)
        } else {
            self.setFrameOrigin(position)
            completion?()
        }
    }

    public func change(size: NSSize, animated: Bool = false, duration: Double = 0.2, completion: (() -> Void)? = nil) {
        if animated {
            NSAnimationContext.runAnimationGroup({ context in
                context.duration = duration
                context.timingFunction = CAMediaTimingFunction(name: .easeOut)
                self.animator().setFrameSize(size)
            }, completionHandler: completion)
        } else {
            self.setFrameSize(size)
            completion?()
        }
    }
}

public extension NSView {
    var miniKitWindow: Window? {
        return window as? Window
    }
}
