import AppKit

public final class Link: NSMenuItem {
    private let link: String?
    
    required init(coder: NSCoder) { fatalError() }
    public init(title: String, link: String?) {
        self.link = link
        
        super.init(title: title, action: nil, keyEquivalent: "")
        image = .init(systemSymbolName: "link", accessibilityDescription: "URL")
        
        guard link != nil else {
            isEnabled = false
            return
        }
        
        target = self
        action = #selector(share)
        isEnabled = true
    }
    
    @objc private func share() {
        guard let link else { return }
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(link, forType: .string)
    }
}
