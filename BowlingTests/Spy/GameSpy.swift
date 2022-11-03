@testable import Bowling

class GameSpy: GameProtocol {
    
    var pins: Pin?
    var score = 0
    
    func rollBalls(pins: Pin) {
        self.pins = pins
    }
    
    func calculateScore() {
        score = 20
    }
    
}
