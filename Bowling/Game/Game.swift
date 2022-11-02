class Game {
    
    private (set) var score: Int
    
    init() {
        score = 0
    }
    
    func roll(pins: Int) {
        score += pins
    }
    
}
