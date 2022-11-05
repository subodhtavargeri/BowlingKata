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
    
    struct GameRules {
        static let maximumFrames = 10
        static let incrementCounterToGetNextRollWhenItsAnSpare = 2
        static let incrementCounterToGetNextRollWhenItsAnStrike = 1
        static let incrementCounterToGetNextRollWhenItsAnNormal = 2
    }
    
    struct Message {
        static let gameScore = "Final Score: %@"
    }
}

typealias score = Int
typealias finishedCalculatingGameScore = (score) -> Void
typealias currentRollIndex = Int

