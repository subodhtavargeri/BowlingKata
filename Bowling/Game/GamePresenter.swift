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
                view?.displayPinRollTitle(title: Constant.SpecialPinSymbols.spare)
                incrementRoll(moveToRoll: moveToNextFrameOrRoll)
            }
            else {
                view?.displayPinRollTitle(title: pin.pinSymbols())
                if pin == .ten {
                    incrementRoll(moveToRoll: moveToNextFrameWhenItsAnStike)
                }
                else {
                    incrementRoll(moveToRoll: moveToNextFrameOrRoll)
                }
            }
        }
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
    
    private func incrementRoll(moveToRoll: NextRoll) {
        view?.moveToNextRoll(value: moveToRoll)
    }
    
}
