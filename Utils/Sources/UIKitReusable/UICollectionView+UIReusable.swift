#if canImport(UIKit)
import UIKit


// MARK: - Supplementary View
extension UICollectionView {

    public typealias ReusableSupplementaryView = UICollectionReusableView & UIReusable
    
    public enum SupplementaryViewKind {
        case header
        case footer
        
        var stringValue: String {
            switch self {
            case .header:
                return UICollectionView.elementKindSectionHeader
            case .footer:
                return UICollectionView.elementKindSectionFooter
            }
        }
    }
    
    public func dequeue<Section: ReusableSupplementaryView>(_ type: Section.Type, ofKind kind: SupplementaryViewKind, for indexPath: IndexPath) -> Section! {
        let std = dequeueReusableSupplementaryView(ofKind: kind.stringValue, withReuseIdentifier: Section.reuseIdentifier, for: indexPath)
        guard let custom = std as? Section else { return nil }
        return custom
    }
    
    public func dequeue<Section: ReusableSupplementaryView>(_ type: Section.Type, ofKind kind: SupplementaryViewKind, for indexPath: IndexPath, block: (Section) -> Void) -> Section! {
        guard let section = dequeue(Section.self, ofKind: kind, for: indexPath) else { return nil }
        block(section)
        return section
    }
    
}


// MARK: - Cell
extension UICollectionView {
    
    public typealias ReusableCell = UICollectionViewCell & UIReusable
    
    public func register<Cell: ReusableCell>(_ type: Cell.Type) {
        register(type, forCellWithReuseIdentifier: type.reuseIdentifier)
    }
    
    private func dequeue<Cell: ReusableCell>(_ type: Cell.Type, for indexPath: IndexPath) -> Cell! {
        let std = dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath)
        guard let custom = std as? Cell else { return nil }
        return custom
    }
    
    public func dequeue<Cell: ReusableCell>(_ type: Cell.Type, for indexPath: IndexPath, block: (Cell) -> Void) -> Cell! {
        guard let cell = dequeue(Cell.self, for: indexPath) else { return nil }
        block(cell)
        return cell
    }
    
}
#endif
