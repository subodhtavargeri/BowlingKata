protocol GameProtocol {
    func rollBalls(pins: Pin)
    func calculateScore() -> Int
}

class Game {
    
    private var roll: RollProtocol
    
    init(roll: RollProtocol) {
        self.roll = roll
    }
    
    func rollBalls(pins: Pin) {
        roll.append(pin: pins)
    }
    
    func calculateScore() -> Score {
        var rollIndex = 0
        var score = 0
        
        for _ in 1...10 {
            
            if !isValidIndex(rollIndex: rollIndex) {
                return 0
            }
            
            let rollScore = roll.atIndex(index: rollIndex)
            
            if isStrike(score: rollScore) {
                score += strikeScore(rollIndex: rollIndex)
                rollIndex+=1
                continue
            }
            
            if isSpare(rollIndex: rollIndex) {
                score += spareScore(rollIndex: rollIndex)
                rollIndex+=2
                continue
            }
            
            score += normalScore(rollIndex: rollIndex)
            rollIndex+=2
        }
        
        return score
    }
    
    func resetGame() {
        roll.resetRoll()
    }
    
    private func isValidIndex(rollIndex: Int) -> Bool {
        return roll.isValidIndex(rollIndex: rollIndex)
    }
    
    private func normalScore(rollIndex: Int)-> Score {
        return roll.getRawValue(index: rollIndex) + roll.getRawValue(index: rollIndex+1)
    }
    
    private func isSpare(rollIndex: Int)-> Bool {
        return roll.getRawValue(index: rollIndex) + roll.getRawValue(index: rollIndex+1) == Pin.ten.rawValue
    }
    
    private func spareScore(rollIndex: Int)-> Score {
        return roll.getRawValue(index: rollIndex) + roll.getRawValue(index: rollIndex+1) +  roll.getRawValue(index: rollIndex+2)
    }
    
    private func isStrike(score: Pin)-> Bool {
        return score == Pin.ten
    }
    
    private func strikeScore(rollIndex: Int)-> Score {
        return roll.getRawValue(index: rollIndex) + roll.getRawValue(index: rollIndex + 1) + roll.getRawValue(index: rollIndex + 2)
    }
    
}
