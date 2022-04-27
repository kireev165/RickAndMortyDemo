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

    static let statusTitle = String(localized: "Status", comment: "A title for a `status` field")

    static func localizedValue(forStatus status: Character.Status) -> String {
        switch status {
        case .alive:
            return aliveStatus
        case .dead:
            return deadStatus
        case .unknown:
            return unknownStatus
        }
    }

    static let aliveStatus = String(localized: "Alive", comment: "`Alive` character status")

    static let deadStatus = String(localized: "Dead", comment: "`Dead` character status")

    static let unknownStatus = String(localized: "Unknown", comment: "`Unknown` (alive or dead) character status")

    static let lastKnownLocationTitle = String(localized: "Last location", comment: "A title for a character's  `last known location` field")

    static let episodesCountTitle = String(localized: "Episodes count", comment: "A title for a field describing an `episodes count` which a character appeared in")

}
