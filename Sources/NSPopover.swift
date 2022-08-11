import AppKit

extension NSPopover {
    public func show(content: NSView, on: NSView, edge: NSRectEdge) {
        behavior = .transient
        contentSize = content.frame.size
        contentViewController = .init()
        contentViewController!.view = content
        show(relativeTo: on.bounds, of: on, preferredEdge: edge)
        contentViewController!.view.window!.makeKey()
    }
    
    public class func close(content: NSView) {
        (content.window?.value(forKey: "_popover") as? Self)?.close()
    }
}
