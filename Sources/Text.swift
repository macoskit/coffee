import AppKit

public final class Text: NSTextField {
    private let vibrancy: Bool
    
    required init?(coder: NSCoder) { nil }
    public init(vibrancy: Bool) {
        self.vibrancy = vibrancy
        
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        isBezeled = false
        isEditable = false
        setAccessibilityRole(.staticText)
    }
    
    public override var acceptsFirstResponder: Bool {
        false
    }
    
    public override var canBecomeKeyView: Bool {
        false
    }
    
    public override var allowsVibrancy: Bool {
        vibrancy
    }
    
    public override func acceptsFirstMouse(for: NSEvent?) -> Bool {
        false
    }
}
