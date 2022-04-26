import Foundation


@available(macOS 10.12, *)
@available(iOS 10.0, *)
public struct ApiClient {

    public static let defaultBaseURL: URL = .init(string: "https://rickandmortyapi.com/api")!

    public static let defaultJSONDecoder: JSONDecoder = makeDefaultJSONDecoder()
    private static func makeDefaultJSONDecoder() -> JSONDecoder {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }

    public init(baseURL: URL = defaultBaseURL, session: URLSession = .shared, callbackQueue: DispatchQueue = .main) {
        self.baseURL = baseURL
        self.session = session
        self.callbackQueue = callbackQueue
    }

    public let baseURL: URL

    public let session: URLSession

    public let callbackQueue: DispatchQueue


    // MARK: - resources

    public var character: ResourceMethods<Character, CharacterQueryFilters> {
        .init(client: self, path: "character")
    }

    public var location: ResourceMethods<Location, LocationQueryFilters> {
        .init(client: self, path: "location")
    }

    public var episode: ResourceMethods<Episode, EpisodeQueryFilters> {
        .init(client: self, path: "episode")
    }


    // MARK: - internal

    func getCodableByURL<T: Codable>(codable: T.Type, url: URL, decoder: JSONDecoder = defaultJSONDecoder, callback: @escaping (Result<T, APIMethodError>) -> Void) {
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                callback(.failure(.transport(error)))
            } else {
                do {
                    let response = try decoder.decode(T.self, from: data ?? Data())
                    callbackQueue.async {
                        callback(.success(response))
                    }
                } catch let e {
                    callbackQueue.async {
                        callback(.failure(.decoding(e)))
                    }
                }
            }
        }
        .resume()
    }

}
