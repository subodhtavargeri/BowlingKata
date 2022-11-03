import XCTest
@testable import Bowling

class GamePresenterTests: XCTestCase {
    let game = GameSpy()
    let view = BowlingViewControllerSpy()
    var presenter: GamePresenter?
    
    override func setUp() {
        presenter = GamePresenter(game: game, view: view)
    }
    
    func test_PlayerRollsScoreIsTwo_WhenPlayerKnocksTwoPin() {
        presenter?.playerRolls(knockedPins: 2)
        
        XCTAssertEqual(game.pins, Pin.two)
    }
    
    func test_PlayerRollsScoreIsZero_WhenPlayerKnocksZeroPin() {
        presenter?.playerRolls(knockedPins: 0)
        
        XCTAssertEqual(game.pins, Pin.zero)
    }
    
    func test_GetGameFinalScore_WhenValidFrames() {
        presenter?.getGameFinalScore()
        
        XCTAssertEqual(game.calculateScore(), 20)
    }
    
    func test_PinScoreIsDisplayed_WhenPlayerKnocksTwoPin() {
        presenter?.playerRolls(knockedPins: 2)
        
        XCTAssertEqual(view.title, String(2))
    }
}
