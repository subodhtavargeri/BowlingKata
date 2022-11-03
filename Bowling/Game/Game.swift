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
    
    func calculateScore() {
        var rollIndex = 0
        for _ in 1...10 {
            let rollScore = rolls[rollIndex]
            
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
            else {
                score += normalScore(rollIndex: rollIndex)
                rollIndex+=2
            }
        }
    }
    
    private func normalScore(rollIndex: Int)-> Int {
        return rolls[rollIndex].rawValue + rolls[rollIndex+1].rawValue
    }
    
    private func isSpare(rollIndex: Int)-> Bool {
        return rolls[rollIndex].rawValue + rolls[rollIndex+1].rawValue == 10
    }
    
    private func spareScore(rollIndex: Int)-> Int {
        return rolls[rollIndex].rawValue + rolls[rollIndex+1].rawValue + rolls[rollIndex+2].rawValue
    }
    
    private func isStrike(score: Pin)-> Bool {
        return score.rawValue == 10
    }
    
    private func strikeScore(rollIndex: Int)-> Int {
        return rolls[rollIndex].rawValue  + rolls[rollIndex + 1].rawValue  + rolls[rollIndex + 2].rawValue
    }
}
