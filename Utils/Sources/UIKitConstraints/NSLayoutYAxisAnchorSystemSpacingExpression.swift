#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


@available(macOS 10.11, *)
public struct NSLayoutYAxisAnchorSystemSpacingExpression {
    
    init(anchor: NSLayoutYAxisAnchor, spacing: SystemSpacing) {
        self.anchor = anchor
        self.spacing = spacing
    }
    
    let anchor: NSLayoutYAxisAnchor
    
    let spacing: SystemSpacing
    
}


// MARK: - ==
@available(tvOS 11.0, *)
@available(iOS 11.0, *)
@available(macOS 11.0, *)
extension NSLayoutYAxisAnchorSystemSpacingExpression {
    
    public static func == (lhs: NSLayoutYAxisAnchorSystemSpacingExpression, rhs: NSLayoutYAxisAnchorSystemSpacingExpression) -> NSLayoutConstraint {
        lhs.anchor.constraint(equalToSystemSpacingBelow: rhs.anchor, multiplier: rhs.spacing.multiplier - lhs.spacing.multiplier)
    }
    
}


// MARK: - >=
@available(tvOS 11.0, *)
@available(iOS 11.0, *)
@available(macOS 11.0, *)
extension NSLayoutYAxisAnchorSystemSpacingExpression {
    
    public static func >= (lhs: NSLayoutYAxisAnchorSystemSpacingExpression, rhs: NSLayoutYAxisAnchorSystemSpacingExpression) -> NSLayoutConstraint {
        lhs.anchor.constraint(greaterThanOrEqualToSystemSpacingBelow: rhs.anchor, multiplier: rhs.spacing.multiplier - lhs.spacing.multiplier)
    }
    
}


// MARK: - <=
@available(tvOS 11.0, *)
@available(iOS 11.0, *)
@available(macOS 11.0, *)
extension NSLayoutYAxisAnchorSystemSpacingExpression {
    
    public static func <= (lhs: NSLayoutYAxisAnchorSystemSpacingExpression, rhs: NSLayoutYAxisAnchorSystemSpacingExpression) -> NSLayoutConstraint {
        lhs.anchor.constraint(lessThanOrEqualToSystemSpacingBelow: rhs.anchor, multiplier: rhs.spacing.multiplier - lhs.spacing.multiplier)
    }
    
}
