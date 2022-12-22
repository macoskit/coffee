import AppKit

extension Control {
    public final class Vibrant: Control {
        required init?(coder: NSCoder) { nil }
        public init(title: String, radius: CGFloat = 8) {
            let text = Text(vibrancy: false)
            text.stringValue = title
            text.font = .systemFont(ofSize: NSFont.preferredFont(forTextStyle: .body).pointSize, weight: .medium)
            text.textColor = .controlBackgroundColor
            
            super.init(layer: true)
            layer!.cornerRadius = radius
            addSubview(text)
            
            text.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            text.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }
        
        public override func updateLayer() {
            super.updateLayer()
            
            NSApp
                .effectiveAppearance
                .performAsCurrentDrawingAppearance {
                    switch state {
                    case .highlighted, .pressed:
                        layer!.backgroundColor = NSColor.tertiaryLabelColor.cgColor
                    default:
                        layer!.backgroundColor = NSColor.secondaryLabelColor.cgColor
                    }
                }
        }
    }
}
