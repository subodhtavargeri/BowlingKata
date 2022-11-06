import UIKit

protocol BowlingViewProtocol: AnyObject {
    func displayPinRollTitle(title: Title)
    func displayFinalGameScore(score: FinalGameScore)
    func displayViewTitle(title: Title)
    func resetScoreLabel()
    func moveToNextRollOrFrame(value: NextRollOrFrame)
}

class BowlingViewController: UIViewController {
    
    @IBOutlet weak var labelFinalScore: UILabel!
    @IBOutlet var labelPinScore: [UILabel]!
    
    var presenter: GamePresenterProtocol?
    private var currentRoll = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadPresenter()
    }
    
    func setupPresenter(presenter: GamePresenterProtocol) {
        self.presenter = presenter
    }
    
    @IBAction func pinScoreClicked(_ sender: UIButton) {
        let score = Int(sender.titleLabel?.text ?? "0") ?? 0
        presenter?.playerRolls(totalNumberOfPinKnocked: score)
    }
    
    @IBAction func finalScoreButtonClicked(_ sender: Any) {
        presenter?.getGameFinalScore()
    }
    
    @IBAction func buttonResetClicked(_ sender: Any) {
        presenter?.resetGame()
    }
    
}

extension BowlingViewController: BowlingViewProtocol {
    
    func displayPinRollTitle(title: Title) {
        guard let rollScoreLabel = labelPinScore.filter({$0.tag == currentRoll}).first else {
            return
        }
        rollScoreLabel.text = title
    }
    
    func displayFinalGameScore(score: FinalGameScore) {
        labelFinalScore.text = score
    }
    
    func displayViewTitle(title: Title) {
        self.title = title
    }
    
    func resetScoreLabel() {
        labelPinScore.forEach {
            $0.text = ""
        }
        currentRoll = 1
    }
    
    func moveToNextRollOrFrame(value: NextRollOrFrame) {
        currentRoll += value
    }
}
