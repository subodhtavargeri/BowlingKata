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
        presenter?.playerRolls(knockedPins: 2)
        
        presenter?.getGameFinalScore()
        
        XCTAssertEqual(game.calculateScore(), 20)
    }
    
    func test_PinScoreIsDisplayed_WhenPlayerKnocksTwoPin() {
        presenter?.playerRolls(knockedPins: 2)
        
        XCTAssertEqual(view.title, String(2))
    }
    
    func test_PinScoreXIsDisplayed_WhenPlayerKnocksTenPin_Strike() {
        presenter?.playerRolls(knockedPins: 10)
        
        XCTAssertEqual(view.title, "X")
    }
    
    func test_PinScoreSlashIsDisplayed_WhenPlayerKnocksFivePin_Spare() {
        presenter?.playerRolls(knockedPins: 5)
        
        XCTAssertEqual(view.title, "/")
    }
    
    func test_GameFinalScoreIsDisplayed_WhenAllFramesAreFinished() {
        presenter?.playerRolls(knockedPins: 2)
        
        presenter?.getGameFinalScore()
        
        XCTAssertEqual(view.score, "20")
    }
    
    func test_DisplayViewTitle_WhenPresenterLoads() {
        presenter?.loadPresenter()
        
        XCTAssertEqual(view.title, Constant.Title.screenTitle)
    }
    
    func test_ResetProtocolCalled_WhenUserClicksResetButtonFromView() {
        presenter?.resetGame()
        
        XCTAssertNil(game.pins)
    }
    
    func test_ScoreZeroIsDisplayedOnView_WhenResetButtonIsClickedFromView() {
        presenter?.resetGame()
        
        XCTAssertEqual(view.score, "")
    }
}
