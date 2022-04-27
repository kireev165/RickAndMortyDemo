import Foundation
import RestAPI


protocol CharactersListMVPView: AnyObject {

    func set(title: String?)

    func routeToDetails(id: Int)

    func set(isLoading: Bool)

    func reloadCells()

    func present(error: CharactersListMVPErrorModal)

}


protocol CharactersListMVPViewPresenter: AnyObject {

    var numberOfRows: Int { get }

    func load()

    func didScrollToTheEnd()

    func cell(for row: Int) -> CharactersListMVPViewCell

    func selectRow(at index: Int)

}


struct CharactersListMVPViewCell {

    let name: String

    let raceTitle: String

    let raceValue: String

    let genderTitle: String

    let genderValue: String

    let avatar: URL

}


struct CharactersListMVPErrorModal {

    let title: String?

    let message: String?

    let buttonTitle: String?

}


protocol CharactersListMVPModel: AnyObject {

    var presenter: CharactersListMVPModelPresenter? { get set }

    var characters: [CharactersListMVPModelCharacter]? { get }

    func loadCharacters()

    func loadMoreCharactersIfPossible()

}


struct CharactersListMVPModelCharacter {

    let id: Int

    let name: String

    let race: String

    typealias Gender = Character.Gender
    let gender: Gender

    let avatar: URL

}


typealias CharactersListMVPModelError = APIMethodError


protocol CharactersListMVPModelPresenter: AnyObject {

    func model(_ model: CharactersListMVPModel, didSet characters: [CharactersListMVPModelCharacter]?)

    func model(_ model: CharactersListMVPModel, didCatch error: CharactersListMVPModelError)

}
