@testable import Bowling

class RollSpy: RollProtocol {
    
    var roll = [Pin]()
    
    func append(pin: Pin) {
        self.roll.append(pin)
    }
    
    func resetRoll() {
        roll.removeAll()
    }
    
    func getRawValue(index: Int)-> Score {
        return roll[index].rawValue
    }
    
    func pinValueAtIndex(index: Int)-> Pin {
        if roll.indices.contains(index) {
            return roll[index]
        }
        return .zero
    }
    
    func isValidIndex(rollIndex: Int)-> Bool {
        return roll.indices.contains(rollIndex)
    }
    
}
