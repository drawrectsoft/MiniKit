import AppKit

public enum ContainedViewLayoutTransitionCurve {
    case linear
    case easeInOut
    case easeOut
    case spring
}

public enum ContainedViewLayoutTransition {
    case immediate
    case animated(duration: Double, curve: ContainedViewLayoutTransitionCurve)

    public var isAnimated: Bool {
        switch self {
        case .immediate:
            return false
        case .animated:
            return true
        }
    }

    public var duration: Double {
        switch self {
        case .immediate:
            return 0
        case let .animated(duration, _):
            return duration
        }
    }

    public var timingFunctionName: CAMediaTimingFunctionName {
        switch self {
        case .immediate:
            return .linear
        case let .animated(_, curve):
            switch curve {
            case .linear:
                return .linear
            case .easeInOut:
                return .easeInEaseOut
            case .easeOut:
                return .easeOut
            case .spring:
                return .default
            }
        }
    }

    public func updateFrame(view: NSView, frame: NSRect) {
        guard view.frame != frame else { return }

        switch self {
        case .immediate:
            view.frame = frame
        case let .animated(duration, curve):
            if view.window == nil {
                view.frame = frame
                return
            }

            NSAnimationContext.runAnimationGroup { context in
                context.duration = duration
                context.timingFunction = CAMediaTimingFunction(name: timingFunctionName)
                view.animator().frame = frame
            }
        }
    }
}
