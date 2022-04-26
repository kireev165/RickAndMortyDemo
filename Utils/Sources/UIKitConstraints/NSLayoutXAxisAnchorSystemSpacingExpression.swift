#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


@available(macOS 10.11, *)
public struct NSLayoutXAxisAnchorSystemSpacingExpression {
    
    init(anchor: NSLayoutXAxisAnchor, spacing: SystemSpacing) {
        self.anchor = anchor
        self.spacing = spacing
    }
    
    let anchor: NSLayoutXAxisAnchor
    
    let spacing: SystemSpacing
    
}


// MARK: - ==
@available(iOS 11.0, *)
@available(macOS 11.0, *)
@available(tvOS 11.0, *)
extension NSLayoutXAxisAnchorSystemSpacingExpression {
    
    public static func == (lhs: NSLayoutXAxisAnchorSystemSpacingExpression, rhs: NSLayoutXAxisAnchorSystemSpacingExpression) -> NSLayoutConstraint {
        lhs.anchor.constraint(equalToSystemSpacingAfter: rhs.anchor, multiplier: rhs.spacing.multiplier - lhs.spacing.multiplier)
    }
    
}


// MARK: - >=
@available(iOS 11.0, *)
@available(macOS 11.0, *)
@available(tvOS 11.0, *)
extension NSLayoutXAxisAnchorSystemSpacingExpression {
    
    public static func >= (lhs: NSLayoutXAxisAnchorSystemSpacingExpression, rhs: NSLayoutXAxisAnchorSystemSpacingExpression) -> NSLayoutConstraint {
        lhs.anchor.constraint(greaterThanOrEqualToSystemSpacingAfter: rhs.anchor, multiplier: rhs.spacing.multiplier - lhs.spacing.multiplier)
    }
    
}


// MARK: - <=
@available(iOS 11.0, *)
@available(macOS 11.0, *)
@available(tvOS 11.0, *)
extension NSLayoutXAxisAnchorSystemSpacingExpression {
    
    public static func <= (lhs: NSLayoutXAxisAnchorSystemSpacingExpression, rhs: NSLayoutXAxisAnchorSystemSpacingExpression) -> NSLayoutConstraint {
        lhs.anchor.constraint(lessThanOrEqualToSystemSpacingAfter: rhs.anchor, multiplier: rhs.spacing.multiplier - lhs.spacing.multiplier)
    }
    
}
