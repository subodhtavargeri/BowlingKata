import UIKit

protocol BowlingViewProtocol: AnyObject {
    func displayPinRollTitle(title: String)
    func displayFinalGameScore(score: String)
    func displayViewTitle(title: String)
    func resetScoreLabel()
}

class BowlingViewController: UIViewController {
    
    @IBOutlet weak var labelFinalScore: UILabel!
    @IBOutlet var labelPinScore: [UILabel]!
    
    var presenter: GamePresenterProtocol?
    private var currentLabel = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadPresenter()
    }
    
    func setupPresenter(presenter: GamePresenterProtocol) {
        self.presenter = presenter
    }
    
    @IBAction func pinScoreClicked(_ sender: UIButton) {
        let score = Int(sender.titleLabel?.text ?? "0") ?? 0
        presenter?.playerRolls(knockedPins: score)
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
        guard let rollScoreLabel = labelPinScore.filter({$0.tag == currentLabel}).first else {
            return
        }
        
        rollScoreLabel.text = title
        currentLabel += 1
    }
    
    func displayFinalGameScore(score: String) {
        labelFinalScore.text = score
    }
    
    func displayViewTitle(title: String) {
        self.title = title
    }
    
    func resetScoreLabel() {
        labelPinScore.forEach {
            $0.text = ""
        }
        currentLabel = 1
    }
}
