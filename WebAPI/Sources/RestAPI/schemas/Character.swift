import Foundation


/// Character of Rick and Morty
///
/// [docs](https://rickandmortyapi.com/documentation/#character)
public struct Character: Codable {

    public init(id: Int, name: String, status: Character.Status, species: String, type: String, gender: Character.Gender, origin: Character.Location, location: Character.Location, image: URL, episode: [URL], url: URL, created: Date) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }

    /// The id of the character.
    public let id: Int

    /// The name of the character.
    public let name: String

    /// The status of the character ('Alive', 'Dead' or 'unknown').
    public let status: Status

    /// The species of the character.
    public let species: String

    /// The type or subspecies of the character.
    public let type: String

    /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
    public let gender: Gender

    /// Name and link to the character's origin location.
    public let origin: Location

    /// Name and link to the character's last known location endpoint.
    public let location: Location

    /// Link to the character's image. All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
    public let image: URL

    /// List of episodes in which this character appeared.
    public let episode: [URL]

    /// Link to the character's own URL endpoint.
    public let url: URL

    /// Time at which the character was created in the database.
    public let created: Date

}


// MARK: Nested Types
extension Character {

    /// The status of the character ('Alive', 'Dead' or 'unknown').
    public enum Status: String, CaseIterable, Codable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown
    }

    /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
    public enum Gender: String, CaseIterable, Codable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown
    }

    /// Name and link to the character relation location.
    public struct Location: Codable {

        /// The name of the location
        public let name: String

        /// The link to the location
        public let link: URL

    }

}
