
protocol RollProtocol {
    mutating func append(pin: Pin)
    mutating func resetRoll()
    func getRawValue(index: Int) -> Score
    func atIndex(index: Int)-> Pin
    func isValidIndex(rollIndex: Int) -> Bool
}

struct Roll : RollProtocol {
    
    private var rolls: [Pin]
    
    mutating func append(pin: Pin) {
        rolls.append(pin)
    }
    
    func getRawValue(index: Int) -> Score {
        return rolls[index].rawValue
    }
    
    mutating func resetRoll() {
        rolls.removeAll()
    }
    
    func atIndex(index: Int)-> Pin {
        return rolls[index]
    }
    
    func isValidIndex(rollIndex: Int) -> Bool {
        return rolls.indices.contains(rollIndex)
    }
}
