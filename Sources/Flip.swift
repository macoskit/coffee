import AppKit

public final class Flip: NSView {
    public override var isFlipped: Bool {
        true
    }
    
    public override func acceptsFirstMouse(for: NSEvent?) -> Bool {
        true
    }
}
