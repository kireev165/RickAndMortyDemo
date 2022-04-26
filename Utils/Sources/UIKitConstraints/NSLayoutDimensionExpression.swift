#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


@available(macOS 10.11, *)
public struct NSLayoutDimensionExpression {
    
    init(anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        self.anchor = anchor
        self.multiplier = multiplier
        self.constant = constant
    }
    
    let anchor: NSLayoutDimension
    
    let multiplier: CGFloat
    
    let constant: CGFloat
    
}


// MARK: - +
@available(macOS 10.11, *)
extension NSLayoutDimensionExpression {
    
    public static func + (lhs: NSLayoutDimensionExpression, rhs: CGFloat) -> NSLayoutDimensionExpression {
        .init(anchor: lhs.anchor, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
    }
    
    public static func + (lhs: CGFloat, rhs: NSLayoutDimensionExpression) -> NSLayoutDimensionExpression {
        .init(anchor: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant + lhs)
    }
    
}


// MARK: - -
@available(macOS 10.11, *)
extension NSLayoutDimensionExpression {
    
    public static func - (lhs: NSLayoutDimensionExpression, rhs: CGFloat) -> NSLayoutDimensionExpression {
        .init(anchor: lhs.anchor, multiplier: lhs.multiplier, constant: lhs.constant - rhs)
    }
    
}


// MARK: - *
@available(macOS 10.11, *)
extension NSLayoutDimensionExpression {
    
    public static func * (lhs: NSLayoutDimensionExpression, rhs: CGFloat) -> NSLayoutDimensionExpression {
        .init(anchor: lhs.anchor, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
    }
    
    public static func * (lhs: CGFloat, rhs: NSLayoutDimensionExpression) -> NSLayoutDimensionExpression {
        .init(anchor: rhs.anchor, multiplier: rhs.multiplier * lhs, constant: rhs.constant)
    }
    
}


// MARK: - /
@available(macOS 10.11, *)
extension NSLayoutDimensionExpression {
    
    public static func / (lhs: NSLayoutDimensionExpression, rhs: CGFloat) -> NSLayoutDimensionExpression {
        .init(anchor: lhs.anchor, multiplier: lhs.multiplier / rhs, constant: lhs.constant)
    }
    
}
