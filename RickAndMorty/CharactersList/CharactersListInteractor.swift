import RestAPI


final class CharactersListInteractor: CharactersListMVPModel {

    // MARK: - CharactersListMVPModel

    weak var presenter: CharactersListMVPModelPresenter?

    private(set) var characters: [CharactersListMVPModelCharacter]? {
        didSet {
            presenter?.model(self, didSet: characters)
        }
    }

    func loadCharacters() {
        let client = ApiClient()
        client.character.getList { result in
            switch result {
            case .success(let data):
                self.characters = data.results.map { .init(
                    id: $0.id,
                    name: $0.name,
                    race: $0.species,
                    gender: $0.gender,
                    avatar: $0.image
                )}
            case .failure(let error):
                self.presenter?.model(self, didCatch: error)
            }
        }
    }

}
