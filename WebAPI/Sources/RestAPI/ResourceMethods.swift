import Foundation


@available(iOS 10.0, *)
@available(macOS 10.12, *)
public struct ResourceMethods<Resource: Codable, Filters: QueryFilters> {

    public func getList(filter: Filters? = nil, page: Int? = nil, callback: @escaping (Result<ResourceList<Resource>, APIMethodError>) -> Void) {
        let urlWithoutQuery = client.baseURL.appendingPathComponent(path)

        var urlQueryItems = [URLQueryItem]()
        if let filter = filter {
            urlQueryItems.append(contentsOf: filter.urlQueryItems)
        }
        if let page = page {
            urlQueryItems.append(.init(name: "page", value: String(page)))
        }

        let url: URL
        if urlQueryItems.isEmpty {
            url = urlWithoutQuery
        } else {
            var components = URLComponents(url: urlWithoutQuery, resolvingAgainstBaseURL: true)!
            components.queryItems = urlQueryItems
            url = components.url!
        }

        client.getCodableByURL(codable: ResourceList<Resource>.self, url: url, callback: callback)
    }

    public func getOne(id: Int, callback: @escaping (Result<Resource, APIMethodError>) -> Void) {
        let url = client.baseURL
            .appendingPathComponent(path)
            .appendingPathComponent("\(id)")
        client.getCodableByURL(codable: Resource.self, url: url, callback: callback)
    }

    public func getBatch(ids: [Int], callback: @escaping (Result<[Resource], APIMethodError>) -> Void) {
        let url = client.baseURL
            .appendingPathComponent(path)
            .appendingPathComponent(ids.map { String($0) }.joined(separator: ","))
        client.getCodableByURL(codable: [Resource].self, url: url, callback: callback)
    }


    // MARK: - internal

    let client: ApiClient

    let path: String

}
