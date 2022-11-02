enum Pin: Int {
    case zero = 0, one, two, three, four, five, six, seven, eight, nine, ten
}

class Game {
    
    private (set) var score: Int
     
    private var rolls = [Pin]()
    
    init() {
        score = 0
    }
    
    func rollBalls(pins: Pin) {
        rolls.append(pins)
    }
    
    func getscore() {
        var rollIndex = 0
        for _ in 1...10 {
            
            let rollScore = rolls[rollIndex]
            if isStrike(score: rollScore) {
                score += strikeBonusScore(rollIndex: rollIndex)
                rollIndex+=1
                continue
            }
            
            if isSpare(rollIndex: rollIndex) {
                score += spareBonusScore(rollIndex: rollIndex)
            }
            else {
                score += normalScore(rollIndex: rollIndex)
            }
            rollIndex+=2
        }
    }
    
    private func normalScore(rollIndex: Int)-> Int {
        return rolls[rollIndex].rawValue + rolls[rollIndex+1].rawValue
    }
    private func isSpare(rollIndex: Int)-> Bool {
        let frameScore = rolls[rollIndex].rawValue + rolls[rollIndex+1].rawValue
        return frameScore == 10
    }
    
    private func spareBonusScore(rollIndex: Int)-> Int {
        return rolls[rollIndex].rawValue + rolls[rollIndex+1].rawValue + rolls[rollIndex+2].rawValue
    }
    
    private func isStrike(score: Pin)-> Bool {
        return score.rawValue == 10
    }
    private func strikeBonusScore(rollIndex: Int)-> Int {
        return rolls[rollIndex].rawValue  + rolls[rollIndex + 1].rawValue  + rolls[rollIndex + 2].rawValue
    }
}
