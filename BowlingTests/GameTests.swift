import XCTest
@testable import Bowling

class GameTests: XCTestCase {
    
    let game = Game()
    
    func test_GameScoreIsZero_WhenGameBegins() {
        XCTAssertEqual(game.score, 0)
    }
    
    func test_GameScoreIsZero_WhenPlayerDoesNotKnockAnyPins_InAllTwentyFrames() {
        for _ in 1...20 {
            let _ = game.roll(pins: 0)
        }
        
        XCTAssertEqual(game.score, 0)
    }
    
}
