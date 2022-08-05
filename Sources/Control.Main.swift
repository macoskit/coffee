import AppKit

extension Control {
    public final class Main: Control {
        public var color = NSColor.controlAccentColor {
            didSet {
                updateLayer()
            }
        }
        
        public private(set) weak var text: Text!
        
        required init?(coder: NSCoder) { nil }
        public init(title: String) {
            let text = Text(vibrancy: false)
            text.stringValue = title
            text.font = .systemFont(ofSize: 13, weight: .medium)
            text.textColor = .white
            self.text = text
            
            super.init(layer: true)
            layer!.cornerRadius = 13
            addSubview(text)
            
            heightAnchor.constraint(equalToConstant: 26).isActive = true
            
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
                        layer!.backgroundColor = color.withAlphaComponent(0.95).cgColor
                    default:
                        layer!.backgroundColor = color.cgColor
                    }
                }
        }
    }
}
