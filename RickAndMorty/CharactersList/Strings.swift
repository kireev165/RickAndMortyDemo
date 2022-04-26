import RestAPI


enum Strings {

    static let charactersScreenTitle = String(localized: "Characters", comment: "A title for a characters list screen")

    static let raceTitle = String(localized: "Race", comment: "A title for a `race` field")

    static let genderTitle = String(localized: "Gender", comment: "A title for a `gender` field")

    static func localizedValue(forGender gender: Character.Gender) -> String {
        switch gender {
        case .female:
            return femaleGender
        case .genderless:
            return genderlessGender
        case .male:
            return maleGender
        case .unknown:
            return unknownGender
        }
    }

    static let femaleGender = String(localized: "Female", comment: "`Female` character gender")

    static let genderlessGender = String(localized: "Genderless", comment: "`Genderless` character gender")

    static let maleGender = String(localized: "Male", comment: "`Male` character gender")

    static let unknownGender = String(localized: "Unknown", comment: "`Unknown` character gender")

    static let error = String(localized: "Error", comment: "Error modal title")

    static let ok = String(localized: "OK", comment: "OK button")

}
