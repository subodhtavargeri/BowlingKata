protocol GameProtocol {
    func rollBalls(pins: Pin)
    func calculateScore() -> Int
}

class Game {
    
    private var rolls: Roll
    
    func rollBalls(pins: Pin) {
        rolls.append(pin: pins)
        
    }
    
    init() {
        rolls = Roll(rolls: [Pin] ())
    }
    
    func calculateScore() -> Score {
        var rollIndex = 0
        var score = 0
        
        for _ in 1...10 {
            
            if !isValidIndex(rollIndex: rollIndex) {
                return 0
            }
            
            let rollScore = rolls.rolls[rollIndex]
            
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
        return rolls.rolls.indices.contains(rollIndex)
    }
    
    private func normalScore(rollIndex: Int)-> Score {
        return rolls.rolls[rollIndex].rawValue + rolls.rolls[rollIndex+1].rawValue
    }
    
    private func isSpare(rollIndex: Int)-> Bool {
        return rolls.rolls[rollIndex].rawValue + rolls.rolls[rollIndex+1].rawValue == Pin.ten.rawValue
    }
    
    private func spareScore(rollIndex: Int)-> Score {
        return rolls.getRawValue(index: rollIndex) + rolls.getRawValue(index: rollIndex+1) +  rolls.getRawValue(index: rollIndex+2)
    }
    
    private func isStrike(score: Pin)-> Bool {
        return score == Pin.ten
    }
    
    private func strikeScore(rollIndex: Int)-> Score {
        return rolls.rolls[rollIndex].rawValue  + rolls.rolls[rollIndex + 1].rawValue  + rolls.rolls[rollIndex + 2].rawValue
    }
}
