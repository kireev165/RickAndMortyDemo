import XCTest
import RestAPI  // not `@testable` since testing public/open API


class ApiClientTests: XCTestCase {

    // MARK: - defaultBaseURL

    func testDefaultBaseURLIsNotNil() {
        XCTAssertNotNil(ApiClient.defaultBaseURL)
    }


    // MARK: - init

    func testInitWithDefaults() {
        let client = ApiClient()
        XCTAssertEqual(client.baseURL, .init(string: "https://rickandmortyapi.com/api")!)
        XCTAssertEqual(client.session, .shared)
        XCTAssertEqual(client.callbackQueue, .main)
    }

    func testInitBaseURL() {
        let url = URL(string: "https://example.com")!
        let client = ApiClient(baseURL: url)
        XCTAssertEqual(client.baseURL, url)
    }

    func testInitURLSession() {
        let session = URLSession(configuration: .default)
        let client = ApiClient(session: session)
        XCTAssertEqual(client.session, session)
    }

    func testInitCallbackQueue() {
        let queue = DispatchQueue(label: "test")
        let client = ApiClient(callbackQueue: queue)
        XCTAssertEqual(client.callbackQueue, queue)
    }


    // MARK: - GET https://rickandmortyapi.com/api/character

    func testGetCharacterList() {
        let client = ApiClient()
        client.character.getList() { _ in }
    }

    func testGetCharacterListFiltered() {
        let client = ApiClient()
        client.character.getList(filter: .init(
            name: "name",
            status: .alive,
            species: "species",
            type: "type",
            gender: .male
        )) { _ in }
    }

    func testGetCharacterListPage() {
        let client = ApiClient()
        client.character.getList(page: 2) { _ in }
    }


    // MARK: - GET https://rickandmortyapi.com/api/character/2

    func testGetCharacter() {
        let client = ApiClient()
        client.character.getOne(id: 2) { _ in }
    }


    // MARK: - GET https://rickandmortyapi.com/api/character/1,183

    func testGetCharacterBatch() {
        let client = ApiClient()
        client.character.getBatch(ids: [1, 183]) { _ in }
    }


    // MARK: - GET https://rickandmortyapi.com/api/location

    func testGetLocationList() {
        let client = ApiClient()
        client.location.getList() { _ in }
    }

    func testGetLocationListFiltered() {
        let client = ApiClient()
        client.location.getList(filter: .init(name: "name", type: "type", dimension: "dimension")) { _ in }
    }

    func testGetLocationListPage() {
        let client = ApiClient()
        client.location.getList(page: 2) { _ in }
    }


    // MARK: - GET https://rickandmortyapi.com/api/location/3

    func testGetLocation() {
        let client = ApiClient()
        client.location.getOne(id: 3) { _ in }
    }


    // MARK: - GET https://rickandmortyapi.com/api/location/3,21

    func testGetLocationBatch() {
        let client = ApiClient()
        client.location.getBatch(ids: [3, 21]) { _ in }
    }


    // MARK: - GET https://rickandmortyapi.com/api/episode

    func testGetEpisodeList() {
        let client = ApiClient()
        client.episode.getList() { _ in }
    }

    func testGetEpisodeListFiltered() {
        let client = ApiClient()
        client.episode.getList(filter: .init(name: "name", episode: "episode")) { _ in }
    }

    func testGetEpisodeListPage() {
        let client = ApiClient()
        client.episode.getList(page: 2) { _ in }
    }


    // MARK: - GET https://rickandmortyapi.com/api/episode/28

    func testGetEpisode() {
        let client = ApiClient()
        client.episode.getOne(id: 28) { _ in }
    }


    // MARK: - GET https://rickandmortyapi.com/api/episode/10,28

    func testGetEpisodeBatch() {
        let client = ApiClient()
        client.location.getBatch(ids: [10, 28]) { _ in }
    }

}
