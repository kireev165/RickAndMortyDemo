import UIKit


@propertyWrapper
public struct CustomConstraints<View: UIView> {

    public init(wrappedValue: View) {
        self.wrappedValue = wrappedValue
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }

    public var wrappedValue: View {
        didSet {
            wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        }
    }

}
