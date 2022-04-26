/// Protocol for UI class that is *reusable*.
public protocol UIReusable: AnyObject {
    
    /// Reuse identifier of the class.
    ///
    /// Default value is the name of the class.
    static var reuseIdentifier: String { get }
    
}


extension UIReusable {
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
