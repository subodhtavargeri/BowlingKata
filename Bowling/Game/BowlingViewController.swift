import UIKit

protocol BowlingViewProtocol {
    func displayPinRollTitle(title: String)
    func displayFinalGameScore(score: String)
    func displayViewTitle(title: String)
}

class BowlingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
