import XCTest
@testable import Bowling

class GameTests: XCTestCase {
    
    func test_PlayerScoreIsZero_WhenGameBegins() {
        let game = Game()
        
        XCTAssertEqual(game.getScore(), 0)
    }
}
