import XCTest
@testable import Bowling

class GameTests: XCTestCase {
    
    var game: Game?
    
    override func setUp() {
        game = Game()
    }
    
    func test_GameScoreIsZero_WhenGameBegins() {
        XCTAssertEqual(game?.score, 0)
    }
    
    private func rollBalls(knockedPins: Int, roll: Int) {
        for _ in 1...roll {
            let _ = game?.rollBalls(pins: knockedPins)
        }
    }
    
    func test_GameScoreIsZero_WhenPlayerDoesNotKnockAnyPins_InAllTwentyRolls() {
        rollBalls(knockedPins: 0, roll: 20)
        
        XCTAssertEqual(game?.score, 0)
    }
    
    func test_GameScoreIsTwenty_WhenPlayerKnocksOnePin_InAllTwentyRolls() {
        rollBalls(knockedPins: 1, roll: 20)
        
        XCTAssertEqual(game?.score, 20)
    }
    
    func test_GameScoreIsTwelve_WhenPlayerKnocksFourThenOneThenFiveThenTwoPins_InFirstFourRolls() {
        game?.rollBalls(pins: 4)
        game?.rollBalls(pins: 1)
        game?.rollBalls(pins: 5)
        game?.rollBalls(pins: 2)
        
        XCTAssertEqual(game?.score, 12)
    }
}
