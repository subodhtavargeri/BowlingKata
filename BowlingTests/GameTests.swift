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
    
    private func rollBalls(knockedPins: Pin, roll: Int) {
        for _ in 1...roll {
            let _ = game?.rollBalls(pins: knockedPins)
        }
    }
    
    private func loopThroughGameRollBalls(Pins: [Pin]) {
        for pin in Pins {
            game?.rollBalls(pins: pin)
        }
    }
    
    func test_GameScoreIsZero_WhenPlayerScoresZero_InAllTwentyRolls() {
        rollBalls(knockedPins: .zero, roll: 20)
        
        XCTAssertEqual(game?.score, 0)
    }
    
    func test_GameScoreIsTwenty_WhenPlayerScoresOnePin_InAllTwentyRolls() {
        rollBalls(knockedPins: .one, roll: 20)
        
        let originalScore = game?.calculateScore()
        
        XCTAssertEqual(originalScore, 20)
    }
    
    func test_GameScoreIsTwelve_WhenPlayerScoresZeroInSixteenRolls_ThenFourPinsThenOnePinThenFivePinsThenTwoPins_InLastFourRolls() {
        rollBalls(knockedPins: .zero, roll: 16)
        let pinArray = [Pin.four,Pin.one,Pin.five,Pin.two]
        loopThroughGameRollBalls(Pins: pinArray)
        
        let originalScore = game?.calculateScore()
        
        XCTAssertEqual(originalScore, 12)
    }
    
    func test_GameScoreIsSixteen_WhenPlayerScoresFivePinsThenFivePinsThenThreePins_ZeroInNextSeventeenRolls_SpareConditionInBeginning() {
        
        let pinArray = [Pin.five,Pin.five,Pin.three]
        loopThroughGameRollBalls(Pins: pinArray)
        rollBalls(knockedPins: .zero, roll: 17)
        
        let originalScore = game?.calculateScore()
        
        XCTAssertEqual(originalScore, 16)
    }
    
    func test_GameScoreIsOneHundredAndFifty_WhenPlayerScoresFivePinsInAllTwentyOneRolls_SpareConditionThroughtOutRolls() {
        rollBalls(knockedPins: .five, roll: 21)
        
        let originalScore = game?.calculateScore()
        
        XCTAssertEqual(originalScore, 150)
    }
    
    func test_GameScoreIsThirtyThree_WhenPlayerScoresOnePinInFirstEighteenRolls_FiveInNextThreeRolls_GetsOneAdditionRoll_SpareConditionAtEnd() {
        rollBalls(knockedPins: .one, roll: 18)
        let pinArray = [Pin.five,Pin.five,Pin.five]
        loopThroughGameRollBalls(Pins: pinArray)
        
        let originalScore = game?.calculateScore()
        
        XCTAssertEqual(originalScore, 33)
    }
    
    func test_GameScoreIsTwentyNine_WhenPlayerScoresFivePinsThenFivePins_OneInLastEighteenRolls_SpareConditionInBeginning() {
        let pinArray = [Pin.five,Pin.five]
        loopThroughGameRollBalls(Pins: pinArray)
        rollBalls(knockedPins: .one, roll: 18)
        
        let originalScore = game?.calculateScore()
        
        XCTAssertEqual(originalScore, 29)
    }
    
    func test_GameScoreIsFourtyEight_WhenPlayerScoresThreePinsInFirstFourRolls_ThenOnePinInNextFourRolls_ThenFivePinsInNextTwoRolls_TwoPinsInLastTenRolls_SpareConditionInMiddle() {
        rollBalls(knockedPins: .three, roll: 4)
        rollBalls(knockedPins: .one, roll: 4)
        let pinArray = [Pin.five,Pin.five]
        loopThroughGameRollBalls(Pins: pinArray)
        rollBalls(knockedPins: .two, roll: 10)
        
        let originalScore = game?.calculateScore()
        
        XCTAssertEqual(originalScore, 48)
    }
    
    func test_GameScoreIsTwentySeven_WhenPlayerScoresFivePinsThenFivePinsThenFivePinsThenFivePinsThenOnePins_ZeroInLastFifteenRolls_TwoSpareCondition() {
        let pinArray = [Pin.five,Pin.five,Pin.five,Pin.five,Pin.one]
        loopThroughGameRollBalls(Pins: pinArray)
        rollBalls(knockedPins: .zero, roll: 15)
        
        let originalScore = game?.calculateScore()
        
        XCTAssertEqual(originalScore, 27)
    }
    
    func test_GameScoreIsThreeHundred_WhenPlayerScoresTenInAllTwelveRolls_GetsTwoAdditionalRolls_StrikeThroughtOut() {
        rollBalls(knockedPins: .ten, roll: 12)
        
        let originalScore = game?.calculateScore()
        
        XCTAssertEqual(originalScore, 300)
    }
    
    func test_GameScoreIsThirty_WhenPlayerScoresTenInFirstRoll_ThenAllOnesInNextRoll_StrikeInBeginning() {
        rollBalls(knockedPins: .ten, roll: 1)
        rollBalls(knockedPins: .one, roll: 18)
        
        let originalScore = game?.calculateScore()
        
        XCTAssertEqual(originalScore, 30)
    }
    
    func test_GameScoreIsTwentySix_WhenPlayerScoresTenInFirstRoll_ThenSevenAndOneInNextTwoRolls_ZeroInNextSixteenRolls_StrikeInBeginning() {
        rollBalls(knockedPins: .ten, roll: 1)
        rollBalls(knockedPins: .seven, roll: 1)
        rollBalls(knockedPins: .one, roll: 1)
        rollBalls(knockedPins: .zero, roll: 16)
        
        let originalScore = game?.calculateScore()
        
        XCTAssertEqual(originalScore, 26)
    }
}
