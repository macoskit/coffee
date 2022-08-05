import AppKit

public final class Stack: NSStackView {
    public override func updateLayer() {
        views
            .forEach {
                $0.updateLayer()
            }
    }
}
