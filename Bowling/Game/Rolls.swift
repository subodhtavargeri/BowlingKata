
protocol RollProtocol {
    func getRawValue(index: CurrentRollIndex)-> Score
    func pinValueAtIndex(index: CurrentRollIndex)-> Pin
    func isValidIndex(rollIndex: CurrentRollIndex)-> Bool
    mutating func append(pin: Pin)
    mutating func resetRoll()
}

struct Rolls : RollProtocol {
    
    private var rolls = [Pin]()
    
    func getRawValue(index: CurrentRollIndex)-> Score {
        if isValidIndex(rollIndex: index) {
            return rolls[index].rawValue
        }
        return .zero
    }
    
    func pinValueAtIndex(index: CurrentRollIndex)-> Pin {
        return rolls[index]
    }
    
    func isValidIndex(rollIndex: CurrentRollIndex)-> Bool {
        return rolls.indices.contains(rollIndex)
    }
    
    mutating func append(pin: Pin) {
        rolls.append(pin)
    }
    
    mutating func resetRoll() {
        rolls.removeAll()
    }
}
