protocol GamePresenterProtocol {
    func playerRolls(totalNumberOfPinKnocked: Score)
    func getGameFinalScore()
    func loadPresenter()
    func resetGame()
}

class GamePresenter: GamePresenterProtocol {
    
    private let game: GameProtocol
    private weak var view: BowlingViewProtocol?
    
    private let moveToNextFrameWhenItsAnStike = 2
    private let moveToNextFrameOrRoll = 1
    
    init(game: GameProtocol, view: BowlingViewProtocol) {
        self.game = game
        self.view = view
    }
    
    func playerRolls(totalNumberOfPinKnocked: Score) {
        guard let pin = Pin(rawValue: totalNumberOfPinKnocked) else {
            return
        }
        
        game.rollBalls(pins: pin) { isSpare in
            if isSpare {
                view?.displayPinRollTitle(title: "/")
            }
            else {
                view?.displayPinRollTitle(title: pin.pinSymbols())
            }
        }
        incrementRoll(pin: pin)
    }
    
    func getGameFinalScore() {
        game.calculateTotalGameScore { score in
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
    
    private func incrementRoll(pin: Pin) {
        if game.isStrike(score: pin) {
            view?.moveToNextRoll(value: moveToNextFrameWhenItsAnStike)
            return
        }
        view?.moveToNextRoll(value: moveToNextFrameOrRoll)
    }
    
}
