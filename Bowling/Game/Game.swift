class Game {
    
    private var score: Int
    
    init() {
        score = 0
    }
    
    func roll(pins: Int) {
        score += pins
    }
    
    func getScore() -> Int {
        return score
    }
}
