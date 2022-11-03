protocol GameProtocol {
    func rollBalls(pins: Pin)
    func calculateScore() -> Int
}

class Game {
    
    private var roll: Roll
    
    func rollBalls(pins: Pin) {
        roll.append(pin: pins)
    }
    
    init(roll: Roll) {
        self.roll = roll
    }
    
    func calculateScore() -> Score {
        var rollIndex = 0
        var score = 0
        
        for _ in 1...10 {
            
            if !isValidIndex(rollIndex: rollIndex) {
                return 0
            }
            
            let rollScore = roll.rolls[rollIndex]
            
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
    
    private func isValidIndex(rollIndex: Int) -> Bool {
        return roll.rolls.indices.contains(rollIndex)
    }
    
    private func normalScore(rollIndex: Int)-> Score {
        return roll.rolls[rollIndex].rawValue + roll.rolls[rollIndex+1].rawValue
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
        return roll.rolls[rollIndex].rawValue  + roll.rolls[rollIndex + 1].rawValue  + roll.rolls[rollIndex + 2].rawValue
    }
}
