protocol GameProtocol {
    func rollBalls(pins: Pin)
    func calculateScore()-> Int
    func resetGame()
}

class Game {
    
    private var roll: RollProtocol
    private var secondRollForSameFrame = 1
    private var firstRollForNextFrame = 1
    private var secondRollForNextFrame = 2
    private var firstRollForNextFrameForSpare = 2
    
    init(roll: RollProtocol) {
        self.roll = roll
    }
    
    func rollBalls(pins: Pin) {
        roll.append(pin: pins)
    }
    
    func calculateScore()-> Score {
        var rollIndex = 0
        var score = 0
        
        for _ in 1...Constant.GameRules.maximumFrames {
            
            if !isValidIndex(rollIndex: rollIndex) {
                return score
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
        
        return score
    }
    
    func resetGame() {
        roll.resetRoll()
    }
    
    private func isValidIndex(rollIndex: Int)-> Bool {
        return roll.isValidIndex(rollIndex: rollIndex)
    }
    
    private func normalScore(rollIndex: Int)-> Score {
        return roll.getRawValue(index: rollIndex) + roll.getRawValue(index: rollIndex + secondRollForSameFrame)
    }
    
    private func isSpare(rollIndex: Int)-> Bool {
        return roll.getRawValue(index: rollIndex) + roll.getRawValue(index: rollIndex + secondRollForSameFrame) == Pin.ten.rawValue
    }
    
    private func spareScore(rollIndex: Int)-> Score {
        return roll.getRawValue(index: rollIndex) + roll.getRawValue(index: rollIndex + secondRollForSameFrame) +  roll.getRawValue(index: rollIndex + firstRollForNextFrameForSpare)
    }
    
    private func isStrike(score: Pin)-> Bool {
        return score == Pin.ten
    }
    
    private func strikeScore(rollIndex: Int)-> Score {
        return roll.getRawValue(index: rollIndex) + roll.getRawValue(index: rollIndex + firstRollForNextFrame) + roll.getRawValue(index: rollIndex + secondRollForNextFrame)
    }
    
}
