import Foundation


/// `/<resource>` API methods where `<resource>` is `location`, `character` or `episode`.
///
/// `Resource` is a single resource such as `Character`, `Location` or `Episode`.
/// `Filters` is a query parameters used for filtering list of a resource.
@available(iOS 10.0, *)
@available(macOS 10.12, *)
public struct ResourceMethods<Resource: Codable, Filters: QueryFilters> {

    /// `GET /<resource>?page=<page>&<filterName>=<filterValue>`
    ///
    /// - parameter filter: Filters to pass as query items.
    /// - parameter page: A `page` query item.
    /// - parameter callback: A callback to execute on `ApiClient.callbackQueue`.
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

    /// `GET /<resource>/<id>`
    ///
    /// - parameter id: The identifier of the resource.
    /// - parameter callback: A callback to execute on `ApiClient.callbackQueue`.
    public func getOne(id: Int, callback: @escaping (Result<Resource, APIMethodError>) -> Void) {
        let url = client.baseURL
            .appendingPathComponent(path)
            .appendingPathComponent("\(id)")
        client.getCodableByURL(codable: Resource.self, url: url, callback: callback)
    }

    /// `GET /<resource>/<id1>,<id2>,<idX>`
    ///
    /// - parameter ids: Identifiers of the resources.
    /// - parameter callback: A callback to execute on `ApiClient.callbackQueue`.
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
