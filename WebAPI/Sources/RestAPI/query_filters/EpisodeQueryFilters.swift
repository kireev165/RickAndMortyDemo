import Foundation


public struct EpisodeQueryFilters: QueryFilters {

    public init(name: String?, episode: String?) {
        self.name = name
        self.episode = episode
    }

    public let name: String?

    public let episode: String?

    public var urlQueryItems: [URLQueryItem] {
        [nameQueryItem, episodeQueryItem].compactMap { $0 }
    }

    var nameQueryItem: URLQueryItem? {
        if let name = name {
            return URLQueryItem(name: "name", value: name)
        } else {
            return nil
        }
    }

    var episodeQueryItem: URLQueryItem? {
        if let episode = episode {
            return URLQueryItem(name: "episode", value: episode)
        } else {
            return nil
        }
    }

}
