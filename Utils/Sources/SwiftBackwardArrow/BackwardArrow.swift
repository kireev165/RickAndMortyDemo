infix operator <-

/// Execute `rhs` passing `lhs` as argument.
@discardableResult
public func <- <T: AnyObject>(lhs: T, rhs: (T) -> Void) -> T {
    rhs(lhs)
    return lhs
}
