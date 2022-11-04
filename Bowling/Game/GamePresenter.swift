protocol GamePresenterProtocol {
    func playerRolls(knockedPins: Int)
    func getGameFinalScore()
    func loadPresenter()
    func resetGame()
}

class GamePresenter: GamePresenterProtocol {
    
    let game: GameProtocol
    weak var view: BowlingViewProtocol?
    
    init(game: GameProtocol, view: BowlingViewProtocol) {
        self.game = game
        self.view = view
    }
    
    func playerRolls(knockedPins: Int) {
        guard let pin = Pin(rawValue: knockedPins) else {
            return
        }
        
        game.rollBalls(pins: pin)
        view?.displayPinRollTitle(title: pin.pinSymbols())
    }
    
    func getGameFinalScore() {
        game.calculateScore { score in
            let message = String(format: Constant.Message.gameScore, arguments: [String(score)])
            view?.displayFinalGameScore(score: message)
        }
    }
    
    func loadPresenter() {
        displayViewTitle()
    }
    
    func resetGame() {
        game.resetGame()
        getGameFinalScore()
        view?.resetScoreLabel()
    }
    
    private func displayViewTitle() {
        view?.displayViewTitle(title: Constant.Title.screenTitle)
    }
}
