import Foundation


/// The location in Rick and Morty
///
/// [docs](https://rickandmortyapi.com/documentation/#location)
public struct Location: Codable {

    public init(id: Int, name: String, type: String, dimension: String, residents: [URL], url: URL, created: Date) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
        self.created = created
    }

    /// The id of the location.
    public let id: Int

    /// The name of the location.
    public let name: String

    /// The type of the location.
    public let type: String

    /// The dimension in which the location is located.
    public let dimension: String

    /// List of character who have been last seen in the location.
    public let residents: [URL]

    /// Link to the location's own endpoint.
    public let url: URL

    /// Time at which the location was created in the database.
    public let created: Date

}
