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
    
    func test_GameScoreIsZero_WhenPlayerDoesNotScore_InAllTwentyRolls() {
        rollBalls(knockedPins: 0, roll: 20)
        
        XCTAssertEqual(game?.score, 0)
    }
    
    func test_GameScoreIsTwenty_WhenPlayerScoresOnePin_InAllTwentyRolls() {
        rollBalls(knockedPins: 1, roll: 20)
        
        game?.getscore()
        
        XCTAssertEqual(game?.score, 20)
    }
    
    func test_GameScoreIsTwelve_WhenPlayerScoresFourPinsThenOnePinThenFivePinsThenTwoPins_InFirstFourRolls() {
        rollBalls(knockedPins: 0, roll: 16)
        game?.rollBalls(pins: 4)
        game?.rollBalls(pins: 1)
        game?.rollBalls(pins: 5)
        game?.rollBalls(pins: 2)
        
        game?.getscore()
        
        XCTAssertEqual(game?.score, 12)
    }
    
    func test_GameScoreIsSixteen_WhenPlayerScoresFivePinsThenFivePinsThenThreePins_InAllTwentOneRolls_SpareConditionInBeginning() {
        
        game?.rollBalls(pins: 5)
        game?.rollBalls(pins: 5)
        game?.rollBalls(pins: 3)
        rollBalls(knockedPins: 0, roll: 17)
        
        game?.getscore()
        XCTAssertEqual(game?.score, 16)
    }
    
    func test_GameScoreIsOneHundredAndFifty_WhenPlayerScoresFivePinsInAllTwentyOneRolls_SpareConditionThroughtOut() {
        rollBalls(knockedPins: 5, roll: 21)
        
        game?.getscore()
        XCTAssertEqual(game?.score, 150)
    }
    
    func test_GameScoreIsThirtyThree_WhenPlayerScoresOnePinInFirstEighteenRolls_FiveInLastTwoRolls_SpareConditionAtEnd() {
        rollBalls(knockedPins: 1, roll: 18)
        
        game?.rollBalls(pins: 5)
        game?.rollBalls(pins: 5)
        game?.rollBalls(pins: 5)
        
        game?.getscore()
        XCTAssertEqual(game?.score, 33)
    }
    
    func test_GameScoreIsSixteen_WhenPlayerScoresFivePinsThenFivePins_OneInLastEighteenRolls_SpareConditionInBeginning() {
        game?.rollBalls(pins: 5)
        game?.rollBalls(pins: 5)
        
        rollBalls(knockedPins: 1, roll: 18)
        
        game?.getscore()
        XCTAssertEqual(game?.score, 29)
    }
    
    func test_GameScoreIsFourtyEight_WhenPlayerScoresThreePinsInFirstFourRolls_ThenOnePinInNextFourRolls_ThenFivePinsInNextTwoRolls_TwoPinsInLastTenRolls_SpareConditionInMiddle() {
        rollBalls(knockedPins: 3, roll: 4)
        rollBalls(knockedPins: 1, roll: 4)
        
        game?.rollBalls(pins: 5)
        game?.rollBalls(pins: 5)
        rollBalls(knockedPins: 2, roll: 10)
        
        game?.getscore()
        XCTAssertEqual(game?.score, 48)
    }
    
    func test_GameScoreIsThreeHundred_WhenPlayerScoresTenInAllTwelveRolls_StrikeThroughtOut() {
        rollBalls(knockedPins: 10, roll: 12)
        
        game?.getscore()
        XCTAssertEqual(game?.score, 300)
    }
}
