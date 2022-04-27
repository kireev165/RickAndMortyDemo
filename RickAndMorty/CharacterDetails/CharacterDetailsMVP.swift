import Foundation

import RestAPI


protocol CharacterDetailsMVPView: AnyObject {

    func set(isLoading: Bool)

    func set(title: String?)

    func reloadTable()

    func present(alert: CharacterDetailsMVPViewAlert)
    
}


protocol CharacterDetailsMVPViewPresenter: AnyObject {

    var numberOfRows: Int { get }

    func load()

    func cell(for index: Int) -> CharacterDetailsMVPViewCell

}


enum CharacterDetailsMVPViewCell {
    case image(URL)
    case titledValue(title: String, value: String)
}


struct CharacterDetailsMVPViewAlert {
    let title: String?
    let message: String?
    let buttonTitle: String
}


protocol CharacterDetailsMVPModel: AnyObject {

    init(id: Int)

    var presenter: CharacterDetailsMVPModelPresenter? { get set }

    var data: CharacterDetailsMVPModelData? { get }

    func loadData()

}


protocol CharacterDetailsMVPModelPresenter: AnyObject {

    func model(_ model: CharacterDetailsMVPModel, didSet data: CharacterDetailsMVPModelData?)

    func model(_ model: CharacterDetailsMVPModel, didCatch error: CharacterDetailsMVPModelError)

}


struct CharacterDetailsMVPModelData {

    let name: String

    let race: String

    let gender: Gender
    typealias Gender = Character.Gender

    let status: Status
    typealias Status = Character.Status

    let avatar: URL

    let lastKnownLocation: String

    let episodesCount: Int

}


typealias CharacterDetailsMVPModelError = APIMethodError
