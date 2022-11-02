import XCTest
@testable import Bowling

class GameTests: XCTestCase {
    
    func test_GameScoreIsZero_WhenGameBegins() {
        let game = Game()
        
        XCTAssertEqual(game.getScore(), 0)
    }
    
    func test_PlayerScoreIsZero_WhenPlayerDoesNotKnockAnyPins_InAllTenFrames() {
        let game = Game()
        
        for _ in 1...10 {
            let _ = game.roll(pins: 0)
        }
        
        XCTAssertEqual(game.getScore(), 0)
    }
    
}
