/// An API response containing list of items (characters, episodes or locations).
///
/// [docs](https://rickandmortyapi.com/documentation/#info-and-pagination)
public struct ResourceList<Resource: Codable>: Codable {

    public init(info: Info, results: [Resource]) {
        self.info = info
        self.results = results
    }

    /// An `info` object with information about the response.
    public let info: Info

    /// A list of items
    public let results: [Resource]

}
