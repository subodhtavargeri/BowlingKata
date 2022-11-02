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
        for index in 1...roll {
            print("index::\(index)")
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
        rollBalls(knockedPins: 0, roll: 16)
        game?.rollBalls(pins: 4)
        game?.rollBalls(pins: 1)
        game?.rollBalls(pins: 5)
        game?.rollBalls(pins: 2)
        
        XCTAssertEqual(game?.score, 12)
    }
    
    func test_GameScoreIsSixteen_WhenPlayerKnockFiveThenFiveThenThree_InAllTwentOneRolls_SpareCondition() {
        
        game?.rollBalls(pins: 5)
        game?.rollBalls(pins: 5)
        game?.rollBalls(pins: 3)
        rollBalls(knockedPins: 0, roll: 18)
        
        game?.getscore()
        XCTAssertEqual(game?.score, 16)
    }
}
