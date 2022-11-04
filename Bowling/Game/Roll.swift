
protocol RollProtocol {
    mutating func append(pin: Pin)
    mutating func resetRoll()
    func getRawValue(index: Int)-> Score
    func pinValueAtIndex(index: Int)-> Pin
    func isValidIndex(rollIndex: Int)-> Bool
}

struct Roll : RollProtocol {
    
    private var rolls = [Pin]()
    
    mutating func append(pin: Pin) {
        rolls.append(pin)
    }
    
    func getRawValue(index: currentRollIndex)-> Score {
        
        if isValidIndex(rollIndex: index) {
            return rolls[index].rawValue
        }
        return .zero
    }
    
    mutating func resetRoll() {
        rolls.removeAll()
    }
    
    func pinValueAtIndex(index: currentRollIndex)-> Pin {
        return rolls[index]
    }
    
    func isValidIndex(rollIndex: currentRollIndex)-> Bool {
        return rolls.indices.contains(rollIndex)
    }
}
