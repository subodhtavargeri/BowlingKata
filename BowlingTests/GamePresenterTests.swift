import XCTest
@testable import Bowling

class GamePresenterTests: XCTestCase {
    
    func test_PlayerRollsScoreIsTwo_WhenPlayerKnocksTwoPin() {
        let game = GameSpy()
        let presenter = GamePresenter(game: game)
        
        presenter.playerRolls(knockedPins: 2)
        
        XCTAssertEqual(game.pins, Pin.two)
    }
    
}
