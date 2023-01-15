import AppKit

extension NSMenuItem {
    public class func menu(_ title: String) -> NSMenuItem {
        let menu = NSMenuItem(title: title, action: nil, keyEquivalent: "")
        menu.submenu = .init(title: title)
        return menu
    }
    
    public class func item(_ title: String) -> NSMenuItem {
        NSMenuItem(title: title, action: nil, keyEquivalent: "")
    }
    
    public func disabledItems() -> Self {
        submenu!.autoenablesItems = false
        return self
    }
    
    public func with(enabled: Bool) -> Self {
        isEnabled = enabled
        return self
    }
    
    public func with(action: Selector) -> Self {
        self.action = action
        return self
    }
    
    public func with(action: String) -> Self {
        self.action = Selector((action))
        return self
    }
    
    public func with(key: String) -> Self {
        keyEquivalent = key
        return self
    }
    
    public func with(tag: Int) -> Self {
        self.tag = tag
        return self
    }
    
    public func with(image: NSImage) -> Self {
        self.image = image
        return self
    }
    
    public func with(state: Bool) -> Self {
        self.state = state ? .on : .off
        return self
    }
    
    public func with(object: Any?) -> Self {
        representedObject = object
        return self
    }
    
    public func with(items: [NSMenuItem]) -> Self {
        submenu!.items = items
        return self
    }
    
    public func with(delegate: NSMenuDelegate) -> Self {
        submenu!.delegate = delegate
        return self
    }
    
    public func with(modifier: NSEvent.ModifierFlags) -> Self {
        keyEquivalentModifierMask = modifier
        return self
    }
    
    public func with(target: AnyObject?) -> Self {
        self.target = target
        return self
    }
}
