import AppKit

extension Control {
    public final class Prominent: Control {
        public var color = NSColor.controlAccentColor {
            didSet {
                updateLayer()
            }
        }
        
        public private(set) weak var text: Text!
        
        required init?(coder: NSCoder) { nil }
        public init(title: String, radius: CGFloat = 8) {
            let text = Text(vibrancy: false)
            text.stringValue = title
            text.font = .systemFont(ofSize: NSFont.preferredFont(forTextStyle: .body).pointSize, weight: .medium)
            text.textColor = .white
            self.text = text
            
            super.init(layer: true)
            layer!.cornerRadius = radius
            addSubview(text)
            
            bottomAnchor.constraint(equalTo: text.bottomAnchor, constant: 10).isActive = true
            
            text.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            text.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        }
        
        public override func updateLayer() {
            super.updateLayer()
            
            NSApp
                .effectiveAppearance
                .performAsCurrentDrawingAppearance {
                    switch state {
                    case .highlighted, .pressed:
                        layer!.backgroundColor = color.withAlphaComponent(0.95).cgColor
                    default:
                        layer!.backgroundColor = color.cgColor
                    }
                }
        }
    }
}
