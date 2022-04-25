import Foundation


/// The episode of Rick and Morty
///
/// [docs](https://rickandmortyapi.com/documentation/#episode)
public struct Episode: Codable {

    public init(id: Int, name: String, airDate: String, episode: String, characters: [URL], url: URL, created: Date) {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.characters = characters
        self.url = url
        self.created = created
    }

    /// The id of the episode.
    public let id: Int

    /// The name of the episode.
    public let name: String

    /// The air date of the episode.
    public let airDate: String

    /// The code of the episode.
    public let episode: String

    /// List of characters who have been seen in the episode.
    public let characters: [URL]

    /// Link to the episode's own endpoint.
    public let url: URL

    /// Time at which the episode was created in the database.
    public let created: Date

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
        case created
    }

}

