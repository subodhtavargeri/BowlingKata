@testable import Bowling

class BowlingViewControllerSpy: BowlingViewProtocol {
    
    var title: String?
    
    func displayPinRollTitle(title: String) {
        self.title = title
    }
    
}

