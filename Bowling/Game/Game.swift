class Game {
    
    private (set) var score: Int
    
    private var rolls = [Int]()
    
    init() {
        score = 0
    }
    
    func rollBalls(pins: Int) {
        rolls.append(pins)
    }
    
    func getscore() {
        var rollIndex = 0
        for _ in 1...10 {
            
            if isStrike(score: rolls[rollIndex]) {
                strikeBonusScore(rollIndex: rollIndex)
                rollIndex+=1
                continue
            }
            
            let frameScore = rolls[rollIndex] + rolls[rollIndex+1]
            
            if isSpare(frameScore: frameScore) {
                spareBonusScore(rollIndex: rollIndex)
            }
            else {
                score += frameScore
            }
            rollIndex+=2
        }
    }
    
    private func isSpare(frameScore: Int)-> Bool {
        return frameScore == 10
    }
    
    private func spareBonusScore(rollIndex: Int) {
        score += rolls[rollIndex] + rolls[rollIndex+1] + rolls[rollIndex+2]
    }
    
    private func isStrike(score: Int)-> Bool {
        return score == 10
    }
    private func strikeBonusScore(rollIndex: Int) {
        score += rolls[rollIndex]  + rolls[rollIndex + 1]  + rolls[rollIndex + 2]
    }
}
