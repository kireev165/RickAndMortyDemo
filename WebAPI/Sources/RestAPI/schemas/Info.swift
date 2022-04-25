import Foundation


/// An `info` object with information about the response.
///
/// [docs](https://rickandmortyapi.com/documentation/#info-and-pagination)
public struct Info: Codable {

    public init(count: Int, pages: Int, next: URL?, prev: URL?) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }

    /// The length of the response
    public let count: Int

    /// The amount of pages
    public let pages: Int

    /// Link to the next page (if it exists)
    public let next: URL?

    /// Link to the previous page (if it exists)
    public let prev: URL?

}
