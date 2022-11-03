enum Pin: Int {
    case zero = 0, one, two, three, four, five, six, seven, eight, nine, ten
}

protocol GameProtocol {
    func rollBalls(pins: Pin)
    func calculateScore() -> Int
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
    
    func calculateScore() -> Int {
        var rollIndex = 0
        for _ in 1...10 {
            
            if !isValidIndex(rollIndex: rollIndex) {
                return 0
            }
            
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
            
            score += normalScore(rollIndex: rollIndex)
            rollIndex+=2
        }
        return score
    }
    
    private func isValidIndex(rollIndex: Int) -> Bool {
        return rolls.indices.contains(rollIndex)
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
