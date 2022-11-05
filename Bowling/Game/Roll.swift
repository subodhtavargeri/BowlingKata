
protocol RollProtocol {
    mutating func append(pin: Pin)
    mutating func resetRoll()
    func getRawValue(index: CurrentRollIndex)-> Score
    func pinValueAtIndex(index: CurrentRollIndex)-> Pin
    func isValidIndex(rollIndex: CurrentRollIndex)-> Bool
}

struct Roll : RollProtocol {
    
    private var rolls = [Pin]()
    
    mutating func append(pin: Pin) {
        rolls.append(pin)
    }
    
    mutating func resetRoll() {
        rolls.removeAll()
    }
    
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
}
