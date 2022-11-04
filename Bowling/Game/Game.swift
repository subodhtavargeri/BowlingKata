protocol GameProtocol {
    func rollBalls(pins: Pin)
    func calculateScore(scoreCalculationCompletion: finishedCalculatingGameScore)
    func resetGame()
}

class Game: GameProtocol {
    
    private var roll: RollProtocol
    private var secondRollForSameFrame = 1
    private var firstRollForNextFrameWhenItsAnStrike = 1
    private var secondRollForNextFrame = 2
    private var firstRollForNextFrameWhenItsAnSpare = 2
     
    init(roll: RollProtocol) {
        self.roll = roll
    }
    
    func rollBalls(pins: Pin) {
        roll.append(pin: pins)
    }
    
    func calculateScore(scoreCalculationCompletion: finishedCalculatingGameScore) {
        var rollIndex = 0
        var score = 0
        
        for _ in 1...Constant.GameRules.maximumFrames {
            
            if !isValidIndex(rollIndex: rollIndex) {
                scoreCalculationCompletion(score)
                return
            }
            
            let rollScore = roll.pinValueAtIndex(index: rollIndex)
            
            if isStrike(score: rollScore) {
                score += strikeScore(rollIndex: rollIndex)
                rollIndex += Constant.GameRules.incrementCounterToGetNextRollWhenItsAnStrike
                continue
            }
            
            if isSpare(rollIndex: rollIndex) {
                score += spareScore(rollIndex: rollIndex)
                rollIndex += Constant.GameRules.incrementCounterToGetNextRollWhenItsAnSpare
                continue
            }
            
            score += normalScore(rollIndex: rollIndex)
            rollIndex += Constant.GameRules.incrementCounterToGetNextRollWhenItsAnNormal
        }
        
        scoreCalculationCompletion(score)
    }
    
    func resetGame() {
        roll.resetRoll()
    }
    
    private func isValidIndex(rollIndex: currentRollIndex)-> Bool {
        return roll.isValidIndex(rollIndex: rollIndex)
    }
    
    private func normalScore(rollIndex: currentRollIndex)-> Score {
        return roll.getRawValue(index: rollIndex) + roll.getRawValue(index: rollIndex + secondRollForSameFrame)
    }
    
    private func isSpare(rollIndex: currentRollIndex)-> Bool {
        return roll.getRawValue(index: rollIndex) + roll.getRawValue(index: rollIndex + secondRollForSameFrame) == Pin.ten.rawValue
    }
    
    private func spareScore(rollIndex: currentRollIndex)-> Score {
        return roll.getRawValue(index: rollIndex) + roll.getRawValue(index: rollIndex + secondRollForSameFrame) +  roll.getRawValue(index: rollIndex + firstRollForNextFrameWhenItsAnSpare)
    }
    
    private func isStrike(score: Pin)-> Bool {
        return score == Pin.ten
    }
    
    private func strikeScore(rollIndex: currentRollIndex)-> Score {
        return roll.getRawValue(index: rollIndex) + roll.getRawValue(index: rollIndex + firstRollForNextFrameWhenItsAnStrike) + roll.getRawValue(index: rollIndex + secondRollForNextFrame)
    }
    
}
