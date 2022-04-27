import Foundation


final class CharactersListPresenter {

    init(view: CharactersListMVPView, model: CharactersListMVPModel) {
        self.view = view
        self.model = model

        self.model.presenter = self
    }

    unowned let view: CharactersListMVPView

    let model: CharactersListMVPModel

}


extension CharactersListPresenter: CharactersListMVPViewPresenter {

    func didScrollToTheEnd() {
        model.loadMoreCharactersIfPossible()
    }

    var numberOfRows: Int {
        model.characters?.count ?? 0
    }

    func load() {
        view.set(title: Strings.charactersScreenTitle)
        view.set(isLoading: model.characters == nil)
        model.loadCharacters()
    }

    func cell(for row: Int) -> CharactersListMVPViewCell {
        guard let characters = model.characters else {
            fatalError("`model.characters` is `nil` but `cell(for:)` is already called")
        }
        let character = characters[row]
        return .init(
            name: character.name,
            raceTitle: Strings.raceTitle,
            raceValue: character.race,
            genderTitle: Strings.genderTitle,
            genderValue: Strings.localizedValue(forGender: character.gender),
            avatar: character.avatar
        )
    }

    func selectRow(at index: Int) {
        guard let characters = model.characters else {
            fatalError("`selectRow(at:)` is called but `model.characters` is `nil`")
        }
        let character = characters[index]
        view.routeToDetails(id: character.id)
    }

}


extension CharactersListPresenter: CharactersListMVPModelPresenter {

    func model(_ model: CharactersListMVPModel, didSet characters: [CharactersListMVPModelCharacter]?) {
        view.set(isLoading: characters == nil)
        view.reloadCells()
    }

    func model(_ model: CharactersListMVPModel, didCatch error: CharactersListMVPModelError) {
        let message: String
        switch error {
        case .decoding(let decodingError):
            guard let e = decodingError as? DecodingError else { return }
            message = e.localizedDescription
        case .transport(let transportError):
            message = transportError.localizedDescription
        }
        view.present(error: .init(title: Strings.error, message: message, buttonTitle: Strings.ok))
    }

}
