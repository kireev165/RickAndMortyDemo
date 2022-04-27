import RestAPI
import Foundation


final class CharactersListInteractor: CharactersListMVPModel {

    // MARK: - CharactersListMVPModel

    weak var presenter: CharactersListMVPModelPresenter?

    private(set) var characters: [CharactersListMVPModelCharacter]? {
        didSet {
            presenter?.model(self, didSet: characters)
        }
    }

    func loadCharacters() {
        client.character.getList { result in
            switch result {
            case .success(let data):
                self.nextPageNumber = data.info.next?.pageNumber
                self.characters = data.results.mapped
            case .failure(let error):
                self.presenter?.model(self, didCatch: error)
            }
        }
    }

    func loadMoreCharactersIfPossible() {
        guard !isLoadingMore, let nextPageNumber = nextPageNumber else { return }
        isLoadingMore = true
        client.character.getList(page: nextPageNumber) { [self] result in
            defer { self.isLoadingMore = false }
            switch result {
            case .success(let data):
                self.nextPageNumber = data.info.next?.pageNumber
                self.characters?.append(contentsOf: data.results.mapped)
            case .failure(let error):
                self.presenter?.model(self, didCatch: error)
            }
        }
    }


    // MARK: - private

    private let client = ApiClient()

    private var nextPageNumber: Int?

    private var isLoadingMore: Bool = false

}


private extension URL {

    var pageNumber: Int? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let string = components.queryItems?.filter({ $0.name == "page" }).first?.value
        else { return nil }
        return Int(string)
    }

}


private extension Array where Element == Character {

    var mapped: [CharactersListMVPModelCharacter] {
        map { .init(
            id: $0.id,
            name: $0.name,
            race: $0.species,
            gender: $0.gender,
            avatar: $0.image
        )}
    }

}
