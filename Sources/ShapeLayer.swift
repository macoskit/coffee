import QuartzCore

public final class ShapeLayer: CAShapeLayer {
    public override class func defaultAction(forKey: String) -> CAAction? {
        NSNull()
    }
    
    public override func hitTest(_: CGPoint) -> CALayer? {
        nil
    }
}
