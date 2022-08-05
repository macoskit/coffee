import AppKit

public final class Separator: NSView {
    required init?(coder: NSCoder) { nil }
    public init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        wantsLayer = true
    }
    
    public override func updateLayer() {
        NSApp
            .effectiveAppearance
            .performAsCurrentDrawingAppearance {
                layer!.backgroundColor = NSColor.separatorColor.cgColor
            }
    }
    
    public override var allowsVibrancy: Bool {
        true
    }
    
    public override func hitTest(_: NSPoint) -> NSView? {
        nil
    }
}
