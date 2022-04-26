#if canImport(UIKit)
import UIKit


// MARK: - Cell
extension UITableView {
    
    /// Register reusable cell of `type` for `type.reuseIdentifier`.
    /// - parameter type: Type of the cell.
    public func register<Cell: UITableViewCell & UIReusable>(_ type: Cell.Type) {
        register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
    }
    
    /// Dequeue reusable cell of `type` for `indexPath`.
    ///
    /// - precondition: `UITableViewCell` with `type.reuseIdentifier` must be casted safely as
    /// `Cell`.
    /// - parameter type: Type of cell.
    /// - parameter indexPath: Index path of cell.
    public func dequeue<Cell: UITableViewCell & UIReusable>(_ type: Cell.Type, for indexPath: IndexPath) -> Cell! {
        let std = dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath)
        guard let custom = std as? Cell else { return nil }
        return custom
    }
    
    /// Dequeue reusable cell of `type` for `indexPath` and configure it with `block`.
    ///
    /// - precondition: `UITableViewCell` with `type.reuseIdentifier` must be casted safely as
    /// `Cell`.
    /// - parameter type: Type of the cell.
    /// - parameter indexPath: Index path of the cell.
    /// - parameter block: Block configuring the cell.
    /// - parameter cell: Cell to configure.
    public func dequeue<Cell: UITableViewCell & UIReusable>(_ type: Cell.Type, for indexPath: IndexPath, block: (_ cell: Cell) -> Void) -> Cell! {
        guard let cell = dequeue(type, for: indexPath) else { return nil }
        block(cell)
        return cell
    }
    
}


// MARK: - Section
extension UITableView {
    
    /// Register reusable header/footer view of `type` for `type.reuseIdentifier`.
    /// - parameter type: Type of header/footer view to register.
    public func register<Section: UITableViewHeaderFooterView & UIReusable>(_ type: Section.Type) {
        register(type, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }
    
    /// Dequeue reusable header/footer view of `type`.
    /// - parameter type: The type of a view.
    public func dequeue<Section: UITableViewHeaderFooterView & UIReusable>(_ type: Section.Type) -> Section! {
        guard
            let std = dequeueReusableHeaderFooterView(withIdentifier: type.reuseIdentifier),
            let custom = std as? Section
            else { return nil }
        return custom
    }
    
    /// Dequeue reusable header/footer view of `type` then configure it with `block`.
    /// - parameter type: The type of a view.
    /// - parameter block: The block that configures a view.
    /// - parameter section: View to configure.
    public func dequeue<Section: UITableViewHeaderFooterView & UIReusable>(_ type: Section.Type, block: (_ section: Section) -> Void) -> Section! {
        guard let section = dequeue(type) else { return nil }
        block(section)
        return section
    }
    
}
#endif
