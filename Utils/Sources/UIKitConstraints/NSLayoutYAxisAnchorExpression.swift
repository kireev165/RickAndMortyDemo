#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


@available(macOS 10.11, *)
public struct NSLayoutYAxisAnchorExpression {
    
    init(anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        self.anchor = anchor
        self.constant = constant
    }
    
    let anchor: NSLayoutYAxisAnchor
    
    let constant: CGFloat
    
}


// MARK: - ==
@available(macOS 10.11, *)
extension NSLayoutYAxisAnchorExpression {
    
    public static func == (lhs: NSLayoutYAxisAnchorExpression, rhs: NSLayoutYAxisAnchorExpression) -> NSLayoutConstraint {
        lhs.anchor.constraint(equalTo: rhs.anchor, constant: rhs.constant - lhs.constant)
    }
    
}


// MARK: - >=
@available(macOS 10.11, *)
extension NSLayoutYAxisAnchorExpression {
    
    public static func >= (lhs: NSLayoutYAxisAnchorExpression, rhs: NSLayoutYAxisAnchorExpression) -> NSLayoutConstraint {
        lhs.anchor.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant - lhs.constant)
    }
    
}


// MARK: - <=
@available(macOS 10.11, *)
extension NSLayoutYAxisAnchorExpression {
    
    public static func <= (lhs: NSLayoutYAxisAnchorExpression, rhs: NSLayoutYAxisAnchorExpression) -> NSLayoutConstraint {
        lhs.anchor.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant - lhs.constant)
    }
    
}


// MARK: - +
@available(macOS 10.11, *)
extension NSLayoutYAxisAnchorExpression {
    
    public static func + (lhs: NSLayoutYAxisAnchorExpression, rhs: CGFloat) -> NSLayoutYAxisAnchorExpression {
        .init(anchor: lhs.anchor, constant: lhs.constant + rhs)
    }
    
    public static func + (lhs: CGFloat, rhs: NSLayoutYAxisAnchorExpression) -> NSLayoutYAxisAnchorExpression {
        .init(anchor: rhs.anchor, constant: rhs.constant + lhs)
    }
    
}


// MARK: - -
@available(macOS 10.11, *)
extension NSLayoutYAxisAnchorExpression {
    
    public static func - (lhs: NSLayoutYAxisAnchorExpression, rhs: CGFloat) -> NSLayoutYAxisAnchorExpression {
        .init(anchor: lhs.anchor, constant: lhs.constant - rhs)
    }
    
}
