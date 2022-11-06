enum Pin: Int {
    case zero = 0, one, two, three, four, five, six, seven, eight, nine, ten
    
    func pinSymbols()-> String {
        if self == .five {
            return "/"
        }
        
        if self == .ten {
            return "X"
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
}

typealias Score = Int
typealias FinishedCalculatingGameScore = (Score) -> Void
typealias CurrentRollIndex = Int
typealias Title = String
typealias FinalGameScore = String
typealias NextRoll = Int
