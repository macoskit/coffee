import AppKit

public final class Share: NSMenuItem {
    private let url: URL?
    
    required init(coder: NSCoder) { fatalError() }
    public init(title: String, url: URL?) {
        self.url = url
        
        super.init(title: title, action: nil, keyEquivalent: "")
        image = .init(systemSymbolName: "square.and.arrow.up", accessibilityDescription: title)
        submenu = .init(title: title)
        
        guard let url else {
            isEnabled = false
            return
        }
        
        submenu!.items = NSSharingService
            .sharingServices(forItems: [url])
            .map { service in
                .item(service.menuItemTitle)
                .with(action: #selector(share))
                .with(target: self)
                .with(image: service.image)
                .with(object: service)
            }
        isEnabled = true
    }
    
    @objc private func share(_ item: NSMenuItem) {
        guard let url else { return }
        guard let service = item.representedObject as? NSSharingService else { return }
        service.perform(withItems: [url])
    }
}
