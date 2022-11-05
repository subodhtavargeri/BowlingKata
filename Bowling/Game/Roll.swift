
protocol RollProtocol {
    mutating func append(pin: Pin)
    mutating func resetRoll()
    func getRawValue(index: currentRollIndex)-> score
    func pinValueAtIndex(index: currentRollIndex)-> Pin
    func isValidIndex(rollIndex: currentRollIndex)-> Bool
}

struct Roll : RollProtocol {
    
    private var rolls = [Pin]()
    
    mutating func append(pin: Pin) {
        rolls.append(pin)
    }
    
    mutating func resetRoll() {
        rolls.removeAll()
    }
    
    func getRawValue(index: currentRollIndex)-> score {
        if isValidIndex(rollIndex: index) {
            return rolls[index].rawValue
        }
        return .zero
    }
    
    func pinValueAtIndex(index: currentRollIndex)-> Pin {
        return rolls[index]
    }
    
    func isValidIndex(rollIndex: currentRollIndex)-> Bool {
        return rolls.indices.contains(rollIndex)
    }
}
