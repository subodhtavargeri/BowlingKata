@testable import Bowling

class GameSpy: GameProtocol {
    
    var pins: Pin?
    
    func calculateScore() -> Int {
        return (pins != nil) ? 20 : 0
    }
    
    func rollBalls(pins: Pin) {
        self.pins = pins
    }
    
    func resetGame() {
        self.pins = nil
    }

}
