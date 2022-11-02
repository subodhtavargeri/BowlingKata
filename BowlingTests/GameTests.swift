import XCTest
@testable import Bowling

class GameTests: XCTestCase {
    
    func test_GameScoreIsZero_WhenGameBegins() {
        let game = Game()
        
        XCTAssertEqual(game.getScore(), 0)
    }
    
}
