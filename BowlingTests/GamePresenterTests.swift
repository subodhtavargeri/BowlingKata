import XCTest
@testable import Bowling

class GamePresenterTests: XCTestCase {
    let game = GameSpy()
    var presenter: GamePresenter?
    
    override func setUp() {
        presenter = GamePresenter(game: game)
    }
    
    func test_PlayerRollsScoreIsTwo_WhenPlayerKnocksTwoPin() {
        presenter?.playerRolls(knockedPins: 2)
        
        XCTAssertEqual(game.pins, Pin.two)
    }
    
    func test_PlayerRollsScoreIsZero_WhenPlayerKnocksZeroPin() {
        presenter?.playerRolls(knockedPins: 0)
        
        XCTAssertEqual(game.pins, Pin.zero)
    }
    
}
