#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


// MARK: - ==
@available(macOS 10.11, *)
extension NSLayoutXAxisAnchor {
    
    public static func == (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        lhs.constraint(equalTo: rhs)
    }
    
    public static func == (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchorExpression) -> NSLayoutConstraint {
        lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant)
    }
    
    public static func == (lhs: NSLayoutXAxisAnchorExpression, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        lhs.anchor.constraint(equalTo: rhs, constant: -lhs.constant)
    }
    
    @available(iOS 11.0, *)
    @available(macOS 11.0, *)
    @available(tvOS 11.0, *)
    public static func == (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchorSystemSpacingExpression) -> NSLayoutConstraint {
        lhs.constraint(equalToSystemSpacingAfter: rhs.anchor, multiplier: rhs.spacing.multiplier)
    }
    
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    @available(macOS 11.0, *)
    public static func == (lhs: NSLayoutXAxisAnchorSystemSpacingExpression, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        lhs.anchor.constraint(equalToSystemSpacingAfter: rhs, multiplier: -lhs.spacing.multiplier)
    }
    
}


// MARK: - >=
@available(macOS 10.11, *)
extension NSLayoutXAxisAnchor {
    
    public static func >= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        lhs.constraint(greaterThanOrEqualTo: rhs)
    }
    
    public static func >= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchorExpression) -> NSLayoutConstraint {
        lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    }
    
    public static func >= (lhs: NSLayoutXAxisAnchorExpression, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        lhs.anchor.constraint(greaterThanOrEqualTo: rhs, constant: -lhs.constant)
    }
    
    @available(iOS 11.0, *)
    @available(macOS 11.0, *)
    @available(tvOS 11.0, *)
    public static func >= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchorSystemSpacingExpression) -> NSLayoutConstraint {
        lhs.constraint(greaterThanOrEqualToSystemSpacingAfter: rhs.anchor, multiplier: rhs.spacing.multiplier)
    }
    
    @available(iOS 11.0, *)
    @available(macOS 11.0, *)
    @available(tvOS 11.0, *)
    public static func >= (lhs: NSLayoutXAxisAnchorSystemSpacingExpression, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        lhs.anchor.constraint(greaterThanOrEqualToSystemSpacingAfter: rhs, multiplier: -lhs.spacing.multiplier)
    }
    
}


// MARK: - <=
@available(macOS 10.11, *)
extension NSLayoutXAxisAnchor {
    
    public static func <= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        lhs.constraint(lessThanOrEqualTo: rhs)
    }
    
    public static func <= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchorExpression) -> NSLayoutConstraint {
        lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    }
    
    public static func <= (lhs: NSLayoutXAxisAnchorExpression, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        lhs.anchor.constraint(lessThanOrEqualTo: rhs, constant: -lhs.constant)
    }
    
    @available(iOS 11.0, *)
    @available(macOS 11.0, *)
    @available(tvOS 11.0, *)
    public static func <= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchorSystemSpacingExpression) -> NSLayoutConstraint {
        lhs.constraint(lessThanOrEqualToSystemSpacingAfter: rhs.anchor, multiplier: rhs.spacing.multiplier)
    }
    
    @available(iOS 11.0, *)
    @available(macOS 11.0, *)
    @available(tvOS 11.0, *)
    public static func <= (lhs: NSLayoutXAxisAnchorSystemSpacingExpression, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        lhs.anchor.constraint(lessThanOrEqualToSystemSpacingAfter: rhs, multiplier: -lhs.spacing.multiplier)
    }
    
}


// MARK: - +
@available(macOS 10.11, *)
extension NSLayoutXAxisAnchor {
    
    public static func + (lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> NSLayoutXAxisAnchorExpression {
        .init(anchor: lhs, constant: rhs)
    }
    
    public static func + (lhs: CGFloat, rhs: NSLayoutXAxisAnchor) -> NSLayoutXAxisAnchorExpression {
        .init(anchor: rhs, constant: lhs)
    }
    
    public static func + (lhs: NSLayoutXAxisAnchor, rhs: SystemSpacing) -> NSLayoutXAxisAnchorSystemSpacingExpression {
        .init(anchor: lhs, spacing: rhs)
    }
    
    public static func + (lhs: SystemSpacing, rhs: NSLayoutXAxisAnchor) -> NSLayoutXAxisAnchorSystemSpacingExpression {
        .init(anchor: rhs, spacing: lhs)
    }
    
}


// MARK: - -
@available(macOS 10.11, *)
extension NSLayoutXAxisAnchor {
    
    public static func - (lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> NSLayoutXAxisAnchorExpression {
        .init(anchor: lhs, constant: -rhs)
    }
    
    public static func - (lhs: NSLayoutXAxisAnchor, rhs: SystemSpacing) -> NSLayoutXAxisAnchorSystemSpacingExpression {
        .init(anchor: lhs, spacing: -rhs)
    }
    
}
