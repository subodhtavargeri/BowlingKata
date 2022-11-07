enum Pin: Int {
    case zero = 0, one, two, three, four, five, six, seven, eight, nine, ten
    
    func pinSymbols()-> String {
        if self == .ten {
            return Constant.SpecialPinSymbols.strike
        }
        
        return String(rawValue)
    }
}

struct Constant {
    
    struct Title {
        static let screenTitle = "Bowling"
    }
    struct Message {
        static let gameScore = "Final Score: %@"
    }
    
    struct SpecialPinSymbols {
        static let strike = "X"
        static let spare = "-"
    }
}

typealias Score = Int
typealias FinishedCalculatingGameScore = (Score) -> Void
typealias CurrentRollIndex = Int
typealias Title = String
typealias FinalGameScore = String
typealias NextRoll = Int
