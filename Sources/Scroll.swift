import AppKit

public final class Scroll: NSScrollView {
    public required init?(coder: NSCoder) { nil }
    public init() {
        let flip = Flip()
        flip.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        documentView = flip
        hasVerticalScroller = true
        verticalScroller!.controlSize = .mini
        drawsBackground = false
        scrollerInsets.top = 5
        scrollerInsets.bottom = 5
        automaticallyAdjustsContentInsets = false
        
        flip.topAnchor.constraint(equalTo: topAnchor).isActive = true
        flip.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        flip.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
