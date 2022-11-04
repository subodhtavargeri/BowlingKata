protocol GamePresenterProtocol {
    func playerRolls(knockedPins: Int)
    func getGameFinalScore()
    func loadPresenter()
}

class GamePresenter: GamePresenterProtocol {
    
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
        let gameScore = game.calculateScore()
        view.displayFinalGameScore(score: String(gameScore))
    }
    
    func loadPresenter() {
        displayViewTitle()
    }
    
    private func displayViewTitle() {
        view.displayViewTitle(title: Constant.Title.screenTitle)
    }
}
