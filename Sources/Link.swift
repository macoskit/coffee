import AppKit

public final class Link: NSMenuItem {
    private let link: String
    
    required init(coder: NSCoder) { fatalError() }
    public init(title: String, link: String) {
        self.link = link
        
        super.init(title: title, action: nil, keyEquivalent: "")
        target = self
        action = #selector(share)
        image = .init(systemSymbolName: "link", accessibilityDescription: "URL")
    }
    
    @objc private func share() {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(link, forType: .string)
    }
}
