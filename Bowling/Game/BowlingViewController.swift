import UIKit

protocol BowlingViewProtocol: AnyObject {
    func displayPinRollTitle(title: String)
    func displayFinalGameScore(score: String)
    func displayViewTitle(title: String)
}

class BowlingViewController: UIViewController {
    
    var presenter: GamePresenterProtocol?
    
    @IBOutlet weak var labelFinalScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadPresenter()
    }
    
    func setupPresenter(presenter: GamePresenterProtocol) {
        self.presenter = presenter
    }
    
    @IBAction func pinScoreClicked(_ sender: UIButton) {
        presenter?.playerRolls(knockedPins: sender.tag)
    }
    
    @IBAction func finalScoreButtonClicked(_ sender: Any) {
        presenter?.getGameFinalScore()
    }
    @IBAction func buttonResetClicked(_ sender: Any) {
        presenter?.resetGame()
    }
}

extension BowlingViewController: BowlingViewProtocol {
    
    func displayPinRollTitle(title: String) {
        
    }
    
    func displayFinalGameScore(score: String) {
        labelFinalScore.text = score
    }
    
    func displayViewTitle(title: String) {
        self.title = title
    }
    
}
