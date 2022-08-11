import AppKit

public final class Panel: NSPanel {
    private var monitor: Any?
    
    public init(content: NSView, material: NSVisualEffectView.Material = .hudWindow, radius: CGFloat = 10) {
        super.init(contentRect: content.bounds,
                   styleMask: [.borderless],
                   backing: .buffered,
                   defer: true)
        isMovableByWindowBackground = true
        isOpaque = false
        backgroundColor = .clear
        hasShadow = true
        
        let blur = NSVisualEffectView(frame: content.bounds)
        blur.material = material
        blur.state = .active
        blur.wantsLayer = true
        blur.layer!.cornerRadius = radius
        contentView!.addSubview(blur)
        blur.addSubview(content)
        
        center()
        
        monitor = NSEvent
            .addLocalMonitorForEvents(matching: [.leftMouseDown, .rightMouseDown, .otherMouseDown]) { [weak self] event in
                if self?.isVisible == true && event.window != self {
                    self?.close()
                }
                return event
            }
    }
    
    public override func close() {
        monitor
            .map(NSEvent.removeMonitor)
        monitor = nil
        super.close()
    }

    public override var canBecomeKey: Bool {
        true
    }
    
    public override func makeFirstResponder(_ responder: NSResponder?) -> Bool {
        if responder is NSTextContent {
            return super.makeFirstResponder(responder)
        }
        return true
    }
}
