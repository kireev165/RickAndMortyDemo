import Foundation


public struct CharacterQueryFilters: QueryFilters {

    public init(name: String?, status: Status?, species: String?, type: String?, gender: Gender?) {
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
    }

    public let name: String?

    public let status: Status?

    public let species: String?

    public let type: String?

    public let gender: Gender?

    public enum Status: String {
        case alive
        case dead
        case unknown
    }

    public enum Gender: String {
        case female
        case male
        case genderless
        case unknown
    }

    public var urlQueryItems: [URLQueryItem] {
        [nameQueryItem, statusQueryItem, speciesQueryItem, typeQueryItem, genderQueryItem].compactMap { $0 }
    }


    // MARK: - internal

    var nameQueryItem: URLQueryItem? {
        if let name = name {
            return .init(name: "name", value: name)
        } else {
            return nil
        }
    }

    var statusQueryItem: URLQueryItem? {
        if let status = status {
            return .init(name: "status", value: status.rawValue)
        } else {
            return nil
        }
    }

    var speciesQueryItem: URLQueryItem? {
        if let species = species {
            return .init(name: "species", value: species)
        } else {
            return nil
        }
    }

    var typeQueryItem: URLQueryItem? {
        if let type = type {
            return .init(name: "type", value: type)
        } else {
            return nil
        }
    }

    var genderQueryItem: URLQueryItem? {
        if let gender = gender {
            return .init(name: "gender", value: gender.rawValue)
        } else {
            return nil
        }
    }

}
