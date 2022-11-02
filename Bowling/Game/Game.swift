class Game {
    
    private (set) var score: Int
    
    init() {
        score = 0
    }
    
    func rollBalls(pins: Int) {
        score += pins
    }
    
}
