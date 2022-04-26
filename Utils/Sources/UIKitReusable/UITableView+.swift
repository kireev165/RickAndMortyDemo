#if canImport(UIKit)
import UIKit


extension UITableView {
    
    /// Returns the existing table cell of `type` at `indexPath`
    /// - parameter indexPath: The index path locating the row in the table view.
    /// - parameter type: The type the cell must have.
    /// - precondition: The cell at `indexPath` exists.
    /// - precondition: The cell at `indexPath` could be casted as `type`.
    public func cellForRow<T: UITableViewCell>(at indexPath: IndexPath, as type: T.Type) -> T! {
        guard let standard = cellForRow(at: indexPath), let custom = standard as? T else { return nil }
        return custom
    }
    
    /// Returns the existing table cell of `type` at `indexPath` after configuration using `block`.
    /// - parameter indexPath: The index path locating the row in the table view.
    /// - parameter type: The type the cell must have.
    /// - parameter block: The block to configure the `cell`.
    /// - parameter cell: The cell configured in the `block`.
    /// - precondition: The cell at `indexPath` exists.
    /// - precondition: The cell at `indexPath` could be casted as `type`.
    @discardableResult
    public func cellForRow<T: UITableViewCell>(at indexPath: IndexPath, as type: T.Type, block: (_ cell: T) -> Void) -> T! {
        guard let cell = cellForRow(at: indexPath, as: type) else { return nil }
        block(cell)
        return cell
    }
    
}
#endif
