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
}

typealias Score = Int
