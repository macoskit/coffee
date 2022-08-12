import AppKit

extension Control {
    public final class Empty: Control {
        public var color = NSColor.labelColor {
            didSet {
                updateLayer()
            }
        }
        
        required init?(coder: NSCoder) { nil }
        public init() {
            super.init(layer: true)
        }
        
        public override func updateLayer() {
            super.updateLayer()
            
            NSApp
                .effectiveAppearance
                .performAsCurrentDrawingAppearance {
                    switch state {
                    case .pressed, .highlighted:
                        layer!.backgroundColor = color.withAlphaComponent(0.07).cgColor
                    default:
                        layer!.backgroundColor = .clear
                    }
                }
        }
    }
}
