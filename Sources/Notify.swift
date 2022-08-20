import AppKit

open class Notify: NSWindow {
    public init(size: CGSize) {
        super.init(contentRect: .init(origin: .zero, size: size),
                   styleMask: [.titled, .fullSizeContentView], backing: .buffered, defer: true)
        animationBehavior = .alertPanel
        isReleasedWhenClosed = false
        titlebarAppearsTransparent = true
        
        let content = NSVisualEffectView()
        content.state = .active
        content.material = .hudWindow
        contentView = content
        center()
    }
    
    public final override func keyDown(with: NSEvent) {
        switch with.keyCode {
        case 36:
            close()
        default:
            super.keyDown(with: with)
        }
    }
    
    public final override func cancelOperation(_: Any?) {
        close()
    }
}
