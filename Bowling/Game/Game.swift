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
            
            let rollScore = rolls[rollIndex]
            if isStrike(score: rollScore) {
                score += strikeBonusScore(rollIndex: rollIndex)
                rollIndex+=1
                continue
            }
            
            let frameScore = rolls[rollIndex] + rolls[rollIndex+1]
            if isSpare(frameScore: frameScore) {
                score += spareBonusScore(rollIndex: rollIndex)
            }
            else {
                score += normalScore(rollIndex: rollIndex)
            }
            rollIndex+=2
        }
    }
    
    private func normalScore(rollIndex: Int)-> Int {
        return rolls[rollIndex] + rolls[rollIndex+1]
    }
    private func isSpare(frameScore: Int)-> Bool {
        return frameScore == 10
    }
    
    private func spareBonusScore(rollIndex: Int)-> Int {
        return rolls[rollIndex] + rolls[rollIndex+1] + rolls[rollIndex+2]
    }
    
    private func isStrike(score: Int)-> Bool {
        return score == 10
    }
    private func strikeBonusScore(rollIndex: Int)-> Int {
        return rolls[rollIndex]  + rolls[rollIndex + 1]  + rolls[rollIndex + 2]
    }
}
