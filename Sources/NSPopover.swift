import AppKit

extension NSPopover {
    public func show(content: NSView, on: NSView, edge: NSRectEdge) {
        behavior = .transient
        contentSize = content.frame.size
        contentViewController = .init()
        contentViewController!.view = content
        show(relativeTo: on.bounds, of: on, preferredEdge: .minY)
        contentViewController!.view.window!.makeKey()
    }
}
