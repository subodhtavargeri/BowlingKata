import XCTest
@testable import Bowling

class GamePresenterTests: XCTestCase {
    let game = GameSpy()
    let view = BowlingViewControllerSpy()
    var presenter: GamePresenter?
    
    override func setUp() {
        presenter = GamePresenter(game: game, view: view)
    }
    
    func test_PlayerRollScoreIsTwo_WhenPlayerKnocksTwoPin() {
        presenter?.playerRolls(totalNumberOfPinKnocked: 2)
        
        XCTAssertEqual(game.pins, Pin.two)
    }
    
    func test_PlayerRollScoreIsZero_WhenPlayerKnocksZeroPin() {
        presenter?.playerRolls(totalNumberOfPinKnocked: 0)
        
        XCTAssertEqual(game.pins, Pin.zero)
    }
    
    func test_GameFinalScoreIsTwenty_WhenFinalScoreIsDisplayed() {
        presenter?.playerRolls(totalNumberOfPinKnocked: 2)
        
        presenter?.getGameFinalScore()
        
        game.calculateScore { score in
            XCTAssertEqual(score, 20)
        }
    }
    
    func test_PinScoreIsDisplayed_WhenPlayerKnocksTwoPin() {
        presenter?.playerRolls(totalNumberOfPinKnocked: 2)
        
        XCTAssertEqual(view.title, String(2))
    }
    
    func test_PinScoreXIsDisplayed_WhenPlayerKnocksTenPin_Strike() {
        presenter?.playerRolls(totalNumberOfPinKnocked: 10)
        
        XCTAssertEqual(view.title, "X")
    }
    
    func test_PinScoreSlashIsDisplayed_WhenPlayerKnocksFivePin_Spare() {
        presenter?.playerRolls(totalNumberOfPinKnocked: 5)
        
        XCTAssertEqual(view.title, "/")
    }
    
    func test_GameFinalScoreTwentyIsDisplayed_WhenAllFramesAreFinished() {
        presenter?.playerRolls(totalNumberOfPinKnocked: 2)
        
        presenter?.getGameFinalScore()
        
        game.calculateScore { score in
            XCTAssertEqual(view.score, "20")
        }
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
    
    func test_CounterValueIsOne_WhenUserKnocksOnePin() {
        presenter?.playerRolls(totalNumberOfPinKnocked: 1)
        
        XCTAssertEqual(view.counter, 1)
    }
}
