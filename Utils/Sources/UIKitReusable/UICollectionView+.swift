#if canImport(UIKit)
import UIKit


extension UICollectionView {
    
    public func cellForItem<Cell: UICollectionViewCell>(at indexPath: IndexPath, as type: Cell.Type) -> Cell! {
        guard let std = cellForItem(at: indexPath), let custom = std as? Cell else { return nil }
        return custom
    }
    
    public func cellForItem<Cell: UICollectionViewCell>(at indexPath: IndexPath, as type: Cell.Type, block: (_ cell: Cell) -> Void) -> Cell! {
        guard let cell = cellForItem(at: indexPath, as: Cell.self) else { return nil }
        block(cell)
        return cell
    }
    
}
#endif
