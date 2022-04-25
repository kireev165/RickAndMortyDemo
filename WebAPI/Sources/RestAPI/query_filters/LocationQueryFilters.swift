import Foundation


public struct LocationQueryFilters: QueryFilters {

    public init(name: String?, type: String?, dimension: String?) {
        self.name = name
        self.type = type
        self.dimension = dimension
    }

    public let name: String?

    public let type: String?

    public let dimension: String?

    public var urlQueryItems: [URLQueryItem] {
        [nameQueryItem, typeQueryItem, dimensionQueryItem].compactMap { $0 }
    }

    var nameQueryItem: URLQueryItem? {
        if let name = name {
            return URLQueryItem(name: "name", value: name)
        } else {
            return nil
        }
    }

    var typeQueryItem: URLQueryItem? {
        if let type = type {
            return URLQueryItem(name: "type", value: type)
        } else {
            return nil
        }
    }

    var dimensionQueryItem: URLQueryItem? {
        if let dimension = dimension {
            return URLQueryItem(name: "dimension", value: dimension)
        } else {
            return nil
        }
    }

}
