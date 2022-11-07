@testable import Bowling

class GameSpy: GameProtocol {
    var score = 0
    var pins: Pin?
    
    func calculateTotalGameScore(scoreCalculationCompletion: FinishedCalculatingGameScore) {
        score = (pins != nil) ? 20 : 0
    }
    
    func resetGame() {
        self.pins = nil
    }
    
    func isStrike(score: Pin) -> Bool {
        return score == Pin.ten
    }
    
    func rollBalls(pins: Pin, checkForAnSpareFrameCompletion: (Bool) -> Void) {
        self.pins = pins
        checkForAnSpareFrameCompletion(false)
    }
    
}
