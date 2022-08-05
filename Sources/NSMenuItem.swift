import AppKit

extension NSMenuItem {
    public class func parent(_ title: String, _ items: [NSMenuItem]? = nil, transform: ((NSMenuItem) -> Void)? = nil) -> NSMenuItem {
        let menu = NSMenuItem(title: title, action: nil, keyEquivalent: "")
        menu.submenu = .init(title: title)
        items.map {
            menu.submenu!.items = $0
        }
        transform?(menu)
        return menu
    }
    
    public class func child(_ title: String, _ action: Selector? = nil, _ key: String = "", transform: ((NSMenuItem) -> Void) = { _ in }) -> NSMenuItem {
        let item = NSMenuItem(title: title, action: action, keyEquivalent: key)
        transform(item)
        return item
    }
}
