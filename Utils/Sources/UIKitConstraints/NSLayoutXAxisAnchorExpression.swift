#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


@available(macOS 10.11, *)
public struct NSLayoutXAxisAnchorExpression {
    
    init(anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
        self.anchor = anchor
        self.constant = constant
    }
    
    let anchor: NSLayoutXAxisAnchor
    
    let constant: CGFloat
    
}


// MARK: - ==
@available(macOS 10.11, *)
extension NSLayoutXAxisAnchorExpression {
    
    public static func == (lhs: NSLayoutXAxisAnchorExpression, rhs: NSLayoutXAxisAnchorExpression) -> NSLayoutConstraint {
        lhs.anchor.constraint(equalTo: rhs.anchor, constant: rhs.constant - lhs.constant)
    }
    
}


// MARK: - >=
@available(macOS 10.11, *)
extension NSLayoutXAxisAnchorExpression {
    
    public static func >= (lhs: NSLayoutXAxisAnchorExpression, rhs: NSLayoutXAxisAnchorExpression) -> NSLayoutConstraint {
        lhs.anchor.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant - lhs.constant)
    }
    
}


// MARK: - <=
@available(macOS 10.11, *)
extension NSLayoutXAxisAnchorExpression {
    
    public static func <= (lhs: NSLayoutXAxisAnchorExpression, rhs: NSLayoutXAxisAnchorExpression) -> NSLayoutConstraint {
        lhs.anchor.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant - lhs.constant)
    }
    
}


// MARK: - +
@available(macOS 10.11, *)
extension NSLayoutXAxisAnchorExpression {
    
    public static func + (lhs: NSLayoutXAxisAnchorExpression, rhs: CGFloat) -> NSLayoutXAxisAnchorExpression {
        .init(anchor: lhs.anchor, constant: lhs.constant + rhs)
    }
    
    public static func + (lhs: CGFloat, rhs: NSLayoutXAxisAnchorExpression) -> NSLayoutXAxisAnchorExpression {
        .init(anchor: rhs.anchor, constant: rhs.constant + lhs)
    }
    
}


// MARK: - -
@available(macOS 10.11, *)
extension NSLayoutXAxisAnchorExpression {
    
    public static func - (lhs: NSLayoutXAxisAnchorExpression, rhs: CGFloat) -> NSLayoutXAxisAnchorExpression {
        .init(anchor: lhs.anchor, constant: lhs.constant - rhs)
    }
    
}
