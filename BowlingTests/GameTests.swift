import XCTest
@testable import Bowling

class GameTests: XCTestCase {
    
    func test_GameScoreIsZero_WhenGameBegins() {
        let game = Game()
        
        XCTAssertEqual(game.score, 0)
    }
    
    func test_GameScoreIsZero_WhenPlayerDoesNotKnockAnyPins_InAllTwentyFrames() {
        let game = Game()
        
        for _ in 1...20 {
            let _ = game.roll(pins: 0)
        }
        
        XCTAssertEqual(game.score, 0)
    }
    
}
