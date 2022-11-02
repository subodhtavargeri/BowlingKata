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
            let frameScore = rolls[rollIndex] + rolls[rollIndex+1]
            if frameScore == 10 {
                score += frameScore + rolls[rollIndex+2]
            }
            else {
                score += frameScore
            }
            rollIndex+=2
        }
    }
}
