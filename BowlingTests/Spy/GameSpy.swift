@testable import Bowling

class GameSpy: GameProtocol {
    
    var pins: Pin?
    
    func calculateScore() -> Int {
        return 20
    }
    
    func rollBalls(pins: Pin) {
        self.pins = pins
    }

}
