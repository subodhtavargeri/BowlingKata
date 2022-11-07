
protocol RollProtocol {
    func getRawValue(index: CurrentRollIndex)-> Score
    func pinValueAtIndex(index: CurrentRollIndex)-> Pin
    func isValidIndex(rollIndex: CurrentRollIndex)-> Bool
    mutating func append(pin: Pin)
    mutating func resetRoll()
    func isSpareForAnFrameUI()-> Bool
}

struct Rolls : RollProtocol {
    
    private var roll = [Pin]()
    
    func getRawValue(index: CurrentRollIndex)-> Score {
        if isValidIndex(rollIndex: index) {
            return roll[index].rawValue
        }
        return .zero
    }
    
    func pinValueAtIndex(index: CurrentRollIndex)-> Pin {
        return roll[index]
    }
    
    func isValidIndex(rollIndex: CurrentRollIndex)-> Bool {
        return roll.indices.contains(rollIndex)
    }
    
    mutating func append(pin: Pin) {
        roll.append(pin)
    }
    
    mutating func resetRoll() {
        roll.removeAll()
    }
    
    func isSpareForAnFrameUI()-> Bool {
        return roll.count % 2 == 0 && (roll[roll.count-1].rawValue +  roll[roll.count-2].rawValue == Pin.ten.rawValue)
    }
}
