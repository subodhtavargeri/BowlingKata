@testable import Bowling

class RollSpy: RollProtocol {
    
    var roll = [Pin]()
    
    func append(pin: Pin) {
        self.roll.append(pin)
    }
    
    func resetRoll() {
        roll.removeAll()
    }
    
    func getRawValue(index: currentRollIndex)-> Score {
        if isValidIndex(rollIndex: index) {
            return roll[index].rawValue
        }
        return .zero
    }
    
    func pinValueAtIndex(index: currentRollIndex)-> Pin {
        return roll[index]
    }
    
    func isValidIndex(rollIndex: currentRollIndex)-> Bool {
        return roll.indices.contains(rollIndex)
    }
    
}
