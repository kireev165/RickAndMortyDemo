import RestAPI


final class CharacterDetailsInteractor: CharacterDetailsMVPModel {

    init(id: Int) {
        self.id = id
    }

    let id: Int

    weak var presenter: CharacterDetailsMVPModelPresenter?

    private(set) var data: CharacterDetailsMVPModelData? {
        didSet {
            presenter?.model(self, didSet: data)
        }
    }

    func loadData() {
        let client = ApiClient()
        client.character.getOne(id: id) { result in
            switch result {
            case .failure(let error):
                self.presenter?.model(self, didCatch: error)
            case .success(let data):
                self.data = .init(
                    name: data.name,
                    race: data.species,
                    gender: data.gender,
                    status: data.status,
                    avatar: data.image,
                    lastKnownLocation: data.location.name,
                    episodesCount: data.episode.count
                )
            }
        }
    }

}

