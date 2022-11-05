@testable import Bowling

class RollSpy: RollProtocol {
    
    var roll = [Pin]()
    
    func append(pin: Pin) {
        self.roll.append(pin)
    }
    
    func resetRoll() {
        roll.removeAll()
    }
    
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
    
}
