#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


// MARK: - ==
@available(macOS 10.11, *)
extension NSLayoutDimension {
    
    public static func == (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        lhs.constraint(equalToConstant: rhs)
    }
    
    public static func == (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        lhs.constraint(equalTo: rhs)
    }
    
    public static func == (lhs: NSLayoutDimension, rhs: NSLayoutDimensionExpression) -> NSLayoutConstraint {
        lhs.constraint(equalTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    }
    
}


// MARK: - >=
@available(macOS 10.11, *)
extension NSLayoutDimension {
    
    public static func >= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        lhs.constraint(greaterThanOrEqualToConstant: rhs)
    }
    
    public static func >= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        lhs.constraint(greaterThanOrEqualTo: rhs)
    }
    
    public static func >= (lhs: NSLayoutDimension, rhs: NSLayoutDimensionExpression) -> NSLayoutConstraint {
        lhs.constraint(greaterThanOrEqualTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    }
    
}


// MARK: - <=
@available(macOS 10.11, *)
extension NSLayoutDimension {
    
    public static func <= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        lhs.constraint(lessThanOrEqualToConstant: rhs)
    }
    
    public static func <= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        lhs.constraint(lessThanOrEqualTo: rhs)
    }
    
    public static func <= (lhs: NSLayoutDimension, rhs: NSLayoutDimensionExpression) -> NSLayoutConstraint {
        lhs.constraint(lessThanOrEqualTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    }
    
}


// MARK: - +
@available(macOS 10.11, *)
extension NSLayoutDimension {
    
    public static func + (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutDimensionExpression {
        .init(anchor: lhs, constant: rhs)
    }
    
    public static func + (lhs: CGFloat, rhs: NSLayoutDimension) -> NSLayoutDimensionExpression {
        .init(anchor: rhs, constant: lhs)
    }
    
}


// MARK: - -
@available(macOS 10.11, *)
extension NSLayoutDimension {
    
    public static func - (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutDimensionExpression {
        .init(anchor: lhs, constant: -rhs)
    }
    
}


// MARK: - *
@available(macOS 10.11, *)
extension NSLayoutDimension {
    
    public static func * (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutDimensionExpression {
        .init(anchor: lhs, multiplier: rhs)
    }
    
    public static func * (lhs: CGFloat, rhs: NSLayoutDimension) -> NSLayoutDimensionExpression {
        .init(anchor: rhs, multiplier: lhs)
    }
    
}


// MARK: - /
@available(macOS 10.11, *)
extension NSLayoutDimension {
    
    public static func / (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutDimensionExpression {
        .init(anchor: lhs, multiplier: 1 / rhs)
    }
    
}
