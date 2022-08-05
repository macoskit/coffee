import AppKit

public final class Vibrant: NSView {
    required init?(coder: NSCoder) { nil }
    public init(layer: Bool) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        wantsLayer = layer
    }
    
    public override var allowsVibrancy: Bool {
        true
    }
    
    public override func hitTest(_: NSPoint) -> NSView? {
        nil
    }
}
