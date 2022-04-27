final class CharacterDetailsPresenter {

    init(view: CharacterDetailsMVPView, model: CharacterDetailsMVPModel) {
        self.view = view
        self.model = model

        self.model.presenter = self
    }

    unowned let view: CharacterDetailsMVPView

    let model: CharacterDetailsMVPModel

}


extension CharacterDetailsPresenter: CharacterDetailsMVPViewPresenter {

    var numberOfRows: Int {
        if model.data == nil {
            return 0
        } else {
            // name is shown in title bar
            // 1 race, 2 gender, 3 status, 4 avatar, 5 last known location, 6 episodes count
            return 6
        }
    }

    func load() {
        view.set(isLoading: model.data == nil)
        model.loadData()
    }

    func cell(for index: Int) -> CharacterDetailsMVPViewCell {
        guard let data = model.data else {
            fatalError("`cell(for:)` is called while `model.data` is `nil`")
        }
        switch index {
        case 0: // image
            return .image(data.avatar)
        case 1: // race
            return .titledValue(title: Strings.raceTitle, value: data.race)
        case 2: // gender
            return .titledValue(title: Strings.genderTitle, value: Strings.localizedValue(forGender: data.gender))
        case 3: // status
            return .titledValue(title: Strings.statusTitle, value: Strings.localizedValue(forStatus: data.status))
        case 4: // last known location
            return .titledValue(title: Strings.lastKnownLocationTitle, value: data.lastKnownLocation)
        case 5: // episodes count
            return .titledValue(title: Strings.episodesCountTitle, value: .init(data.episodesCount))
        default:
            fatalError("Unexpected index: \(index)")
        }
    }

}


extension CharacterDetailsPresenter: CharacterDetailsMVPModelPresenter {

    func model(_ model: CharacterDetailsMVPModel, didSet data: CharacterDetailsMVPModelData?) {
        view.set(title: data?.name)
        view.set(isLoading: data == nil)
        view.reloadTable()
    }

    func model(_ model: CharacterDetailsMVPModel, didCatch error: CharacterDetailsMVPModelError) {
        view.present(alert: .init(title: Strings.error, message: error.localizedDescription, buttonTitle: Strings.ok))
    }

}
