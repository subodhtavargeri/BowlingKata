class GamePresenter {
    
    let game: GameProtocol
    
    init(game: GameProtocol) {
        self.game = game
    }
    
    func playerRolls(knockedPins: Int) {
        guard let pin = Pin(rawValue: knockedPins) else {
            return
        }
        
        game.rollBalls(pins: pin)
    }
    
    func getGameFinalScore() {
        let _ = game.calculateScore()
    }
}
