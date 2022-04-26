#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


extension NSLayoutConstraint {
    
    public static func activate(@ConstraintsBuilder builder: () -> [NSLayoutConstraint]) {
        let constraints = builder()
        activate(constraints)
    }
    
}
