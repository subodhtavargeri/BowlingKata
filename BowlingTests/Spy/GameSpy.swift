@testable import Bowling

class GameSpy: GameProtocol {
    
    var score = 0
    var pins: Pin?
    
    func calculateTotalGameScore(scoreCalculationCompletion: FinishedCalculatingGameScore) {
        score = (pins != nil) ? 20 : 0
    }
    
    func rollBalls(pins: Pin) {
        self.pins = pins
    }
    
    func resetGame() {
        self.pins = nil
    }
    
    func isStrike(score: Pin) -> Bool {
        return score == Pin.ten
    }
}
