class GamePresenter {
    
    let game: GameProtocol
    let view: BowlingViewProtocol
    
    init(game: GameProtocol, view: BowlingViewProtocol) {
        self.game = game
        self.view = view
    }
    
    func playerRolls(knockedPins: Int) {
        guard let pin = Pin(rawValue: knockedPins) else {
            return
        }
        
        game.rollBalls(pins: pin)
        view.displayPinRollTitle(title: pin.pinSymbols())
    }
    
    func getGameFinalScore() {
        let _ = game.calculateScore()
    }
}
