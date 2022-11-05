@testable import Bowling

class BowlingViewControllerSpy: BowlingViewProtocol {
    
    var title: String?
    var score: String?
    var counter = 0
    
    func displayPinRollTitle(title: String) {
        self.title = title
    }
    
    func displayFinalGameScore(score: String) {
        self.score = score
    }
    
    func displayViewTitle(title: String) {
        self.title = title
    }
    
    func resetScoreLabel() {
        self.score = ""
    }
    
    func incrementLabel(value: Int) {
        counter = value
    }
}

