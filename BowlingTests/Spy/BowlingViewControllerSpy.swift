@testable import Bowling

class BowlingViewControllerSpy: BowlingViewProtocol {
    
    var title: String?
    var score: String?
    
    func displayPinRollTitle(title: String) {
        self.title = title
    }
    
    func displayFinalGameScore(score: String) {
        self.score = score
    }
    
}

