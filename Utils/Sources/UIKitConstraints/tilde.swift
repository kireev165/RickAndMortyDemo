#if canImport(UIKit)
import UIKit
public typealias LayoutPriority = UILayoutPriority
#elseif canImport(AppKit)
import AppKit
public typealias LayoutPriority = NSLayoutConstraint.Priority
#endif


precedencegroup PriorityPrecedence { lowerThan: ComparisonPrecedence }

infix operator ~: PriorityPrecedence

public func ~ (lhs: NSLayoutConstraint, rhs: LayoutPriority) -> NSLayoutConstraint {
    lhs.priority = rhs
    return lhs
}
