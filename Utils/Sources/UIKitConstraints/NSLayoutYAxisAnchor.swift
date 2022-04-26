#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


// MARK: - ==
@available(macOS 10.11, *)
extension NSLayoutYAxisAnchor {
    
    public static func == (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        lhs.constraint(equalTo: rhs)
    }
    
    public static func == (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchorExpression) -> NSLayoutConstraint {
        lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant)
    }
    
    public static func == (lhs: NSLayoutYAxisAnchorExpression, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        lhs.anchor.constraint(equalTo: rhs, constant: -lhs.constant)
    }
    
    @available(iOS 11.0, *)
    @available(macOS 11.0, *)
    @available(tvOS 11.0, *)
    public static func == (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchorSystemSpacingExpression) -> NSLayoutConstraint {
        lhs.constraint(equalToSystemSpacingBelow: rhs.anchor, multiplier: rhs.spacing.multiplier)
    }
    
    @available(iOS 11.0, *)
    @available(macOS 11.0, *)
    @available(tvOS 11.0, *)
    public static func == (lhs: NSLayoutYAxisAnchorSystemSpacingExpression, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        lhs.anchor.constraint(equalToSystemSpacingBelow: rhs, multiplier: -lhs.spacing.multiplier)
    }
    
}


// MARK: - >=
@available(macOS 10.11, *)
extension NSLayoutYAxisAnchor {
    
    public static func >= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        lhs.constraint(greaterThanOrEqualTo: rhs)
    }
    
    public static func >= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchorExpression) -> NSLayoutConstraint {
        lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    }
    
    public static func >= (lhs: NSLayoutYAxisAnchorExpression, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        lhs.anchor.constraint(greaterThanOrEqualTo: rhs, constant: -lhs.constant)
    }
    
    @available(iOS 11.0, *)
    @available(macOS 11.0, *)
    @available(tvOS 11.0, *)
    public static func >= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchorSystemSpacingExpression) -> NSLayoutConstraint {
        lhs.constraint(greaterThanOrEqualToSystemSpacingBelow: rhs.anchor, multiplier: rhs.spacing.multiplier)
    }
    
    @available(iOS 11.0, *)
    @available(macOS 11.0, *)
    @available(tvOS 11.0, *)
    public static func >= (lhs: NSLayoutYAxisAnchorSystemSpacingExpression, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        lhs.anchor.constraint(greaterThanOrEqualToSystemSpacingBelow: rhs, multiplier: -lhs.spacing.multiplier)
    }
    
}



// MARK: - <=
@available(macOS 10.11, *)
extension NSLayoutYAxisAnchor {
    
    public static func <= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        lhs.constraint(lessThanOrEqualTo: rhs)
    }
    
    public static func <= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchorExpression) -> NSLayoutConstraint {
        lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    }
    
    public static func <= (lhs: NSLayoutYAxisAnchorExpression, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        lhs.anchor.constraint(lessThanOrEqualTo: rhs, constant: -lhs.constant)
    }
    
    @available(iOS 11.0, *)
    @available(macOS 11.0, *)
    @available(tvOS 11.0, *)
    public static func <= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchorSystemSpacingExpression) -> NSLayoutConstraint {
        lhs.constraint(lessThanOrEqualToSystemSpacingBelow: rhs.anchor, multiplier: rhs.spacing.multiplier)
    }
    
    @available(iOS 11.0, *)
    @available(macOS 11.0, *)
    @available(tvOS 11.0, *)
    public static func <= (lhs: NSLayoutYAxisAnchorSystemSpacingExpression, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        lhs.anchor.constraint(lessThanOrEqualToSystemSpacingBelow: rhs, multiplier: -lhs.spacing.multiplier)
    }
    
}


// MARK: - +
@available(macOS 10.11, *)
extension NSLayoutYAxisAnchor {
    
    public static func + (lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> NSLayoutYAxisAnchorExpression {
        .init(anchor: lhs, constant: rhs)
    }
    
    public static func + (lhs: CGFloat, rhs: NSLayoutYAxisAnchor) -> NSLayoutYAxisAnchorExpression {
        .init(anchor: rhs, constant: lhs)
    }
    
    public static func + (lhs: NSLayoutYAxisAnchor, rhs: SystemSpacing) -> NSLayoutYAxisAnchorSystemSpacingExpression {
        .init(anchor: lhs, spacing: rhs)
    }
    
    public static func + (lhs: SystemSpacing, rhs: NSLayoutYAxisAnchor) -> NSLayoutYAxisAnchorSystemSpacingExpression {
        .init(anchor: rhs, spacing: lhs)
    }
    
}


// MARK: - -
@available(macOS 10.11, *)
extension NSLayoutYAxisAnchor {
    
    public static func - (lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> NSLayoutYAxisAnchorExpression {
        .init(anchor: lhs, constant: -rhs)
    }
    
    public static func - (lhs: NSLayoutYAxisAnchor, rhs: SystemSpacing) -> NSLayoutYAxisAnchorSystemSpacingExpression {
        .init(anchor: lhs, spacing: -rhs)
    }
    
}
