#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


public struct SystemSpacing {
    
    public init(multiplier: CGFloat = 1) {
        self.multiplier = multiplier
    }
    
    let multiplier: CGFloat
    
}


// MARK: - prefix-
extension SystemSpacing {
    
    public static prefix func - (spacing: SystemSpacing) -> SystemSpacing {
        .init(multiplier: -spacing.multiplier)
    }
    
}


// MARK: - *
extension SystemSpacing {
    
    public static func * (lhs: SystemSpacing, rhs: CGFloat) -> SystemSpacing {
        .init(multiplier: lhs.multiplier * rhs)
    }
    
    public static func * (lhs: CGFloat, rhs: SystemSpacing) -> SystemSpacing {
        .init(multiplier: lhs * rhs.multiplier)
    }
    
    public static func * (lhs: SystemSpacing, rhs: SystemSpacing) -> SystemSpacing {
        .init(multiplier: lhs.multiplier * rhs.multiplier)
    }
    
}


// MARK: - /
extension SystemSpacing {
    
    public static func / (lhs: SystemSpacing, rhs: CGFloat) -> SystemSpacing {
        .init(multiplier: lhs.multiplier / rhs)
    }
    
    public static func / (lhs: CGFloat, rhs: SystemSpacing) -> SystemSpacing {
        .init(multiplier: lhs / rhs.multiplier)
    }
    
    public static func / (lhs: SystemSpacing, rhs: SystemSpacing) -> SystemSpacing {
        .init(multiplier: lhs.multiplier / rhs.multiplier)
    }
    
}

