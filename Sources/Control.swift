import AppKit
import Combine

open class Control: NSView {
    public enum State {
        case
        hidden,
        off,
        on,
        highlighted,
        pressed,
        selected
    }
    
    public final var state = Control.State.on {
        didSet {
            guard state != oldValue else { return }
            updateLayer()
        }
    }
    
    public final let click = PassthroughSubject<Void, Never>()
    
    public required init?(coder: NSCoder) { nil }
    public init(layer: Bool) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setAccessibilityElement(true)
        setAccessibilityRole(.button)
        addTrackingArea(.init(rect: bounds, options: [.mouseEnteredAndExited, .activeAlways, .inVisibleRect], owner: self))
        wantsLayer = layer
        updateLayer()
    }
    
    open override func updateLayer() {
        isHidden = state == .hidden
        alphaValue = state == .off ? 0.25 : 1
    }
    
    open override func mouseEntered(with: NSEvent) {
        guard state == .on || state == .pressed else { return }
        state = .highlighted
    }
    
    open override func mouseExited(with: NSEvent) {
        guard state == .highlighted || state == .pressed else { return }
        state = .on
    }
    
    public final override func resetCursorRects() {
        addCursorRect(bounds, cursor: .arrow)
    }
    
    public final override func mouseDown(with: NSEvent) {
        guard with.clickCount == 1, state == .on || state == .highlighted || state == .pressed else { return }
        window?.makeFirstResponder(nil)
        state = .pressed
    }
    
    public final override func mouseUp(with: NSEvent) {
        guard state != .off && state != .hidden else { return }
        if bounds.contains(convert(with.locationInWindow, from: nil)) {
            click.send()
        }
        if state == .highlighted || state == .pressed {
            state = .on
        }
    }
    
    public final override func shouldDelayWindowOrdering(for: NSEvent) -> Bool {
        true
    }
    
    public final override var acceptsFirstResponder: Bool {
        true
    }
    
    public final override var mouseDownCanMoveWindow: Bool {
        false
    }
    
    public final override func acceptsFirstMouse(for: NSEvent?) -> Bool {
        true
    }
    
    public final override var canBecomeKeyView: Bool {
        true
    }
}
