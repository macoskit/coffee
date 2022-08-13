import AppKit

extension Control {
    public final class Symbol: Control {
        public var color = NSColor.secondaryLabelColor {
            didSet {
                update()
            }
        }
        
        public var symbol: String {
            didSet {
                update()
            }
        }
        
        private weak var image: NSImageView!
        private let background: Bool
        private let size: CGFloat
        private let weight: NSFont.Weight
        
        required init?(coder: NSCoder) { nil }
        public init(symbol: String,
                    size: CGFloat,
                    radius: CGFloat = 7,
                    content: CGFloat = 30,
                    weight: NSFont.Weight = .regular,
                    background: Bool = true) {
            self.symbol = symbol
            self.size = size
            self.weight = weight
            self.background = background
            
            let image = NSImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.imageScaling = .scaleNone
            self.image = image
            
            super.init(layer: true)
            layer!.cornerRadius = radius
            layer!.cornerCurve = .continuous
            addSubview(image)
            
            widthAnchor.constraint(equalToConstant: content).isActive = true
            heightAnchor.constraint(equalToConstant: content).isActive = true
            image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            image.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            image.widthAnchor.constraint(equalToConstant: content).isActive = true
            image.heightAnchor.constraint(equalToConstant: content).isActive = true
        }
        
        public override func updateLayer() {
            super.updateLayer()
            
            guard background else { return }
            
            NSApp
                .effectiveAppearance
                .performAsCurrentDrawingAppearance {
                    switch state {
                    case .pressed, .highlighted:
                        layer!.backgroundColor = NSColor.labelColor.withAlphaComponent(0.07).cgColor
                    default:
                        layer!.backgroundColor = .clear
                    }
                }
        }
        
        public override var allowsVibrancy: Bool {
            true
        }
        
        private func update() {
            image.image = .init(systemSymbolName: symbol, accessibilityDescription: nil)
            image.symbolConfiguration = .init(pointSize: size, weight: weight)
                .applying(.init(hierarchicalColor: .secondaryLabelColor))
        }
    }
}
