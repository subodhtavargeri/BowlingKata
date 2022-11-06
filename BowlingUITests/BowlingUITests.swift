import XCTest

class BowlingUITests: XCTestCase {
    
    func test_GameScoreIsTwelve_WhenPlayerPinsZeroFourOneFiveTwo_AndFinalScoreIsCalculated() {
        let app = XCUIApplication()
        XCUIApplication().activate()
        for _ in 1...16 {
            app.buttons["button_ZeroPin"].tap()
        }
        app.buttons["button_FourPin"].tap()
        app.buttons["button_OnePin"].tap()
        app.buttons["button_FivePin"].tap()
        app.buttons["button_TwoPin"].tap()
        app.buttons["button_FinalScore"].tap()
        let labelFinalscoreStaticText = app.staticTexts["label_FinalScore"]
        XCTAssertTrue(labelFinalscoreStaticText.exists)
        XCTAssertEqual(labelFinalscoreStaticText.label, "Final Score: 12")
        app.buttons["button_Reset"].tap()
    }
    
    func test_GameScoreIsThreeHundred_WithPerfectScore_StrikeThroughOut() {
        let app = XCUIApplication()
        XCUIApplication().activate()
        for _ in 1...12 {
            app.buttons["button_TenPin"].tap()
        }
        let labelFrameOneRollOne = app.staticTexts["label_FrameOneRollOne"]
        XCTAssertTrue(labelFrameOneRollOne.exists)
        XCTAssertEqual(labelFrameOneRollOne.label, "X")
        
        app.buttons["button_FinalScore"].tap()
        let labelFinalscoreStaticText = app.staticTexts["label_FinalScore"]
        XCTAssertEqual(labelFinalscoreStaticText.label, "Final Score: 300")
        app.buttons["button_Reset"].tap()
    }
    
    func test_ScoreIsResetToZero_WhenResetButtonIsPlayed() {
        let app = XCUIApplication()
        XCUIApplication().activate()
        for _ in 1...16 {
            app.buttons["button_OnePin"].tap()
        }
        app.buttons["button_Reset"].tap()
        let labelFinalscoreStaticText = app.staticTexts["label_FinalScore"]
        XCTAssertTrue(labelFinalscoreStaticText.exists)
        XCTAssertEqual(labelFinalscoreStaticText.label, "Final Score: 0")
    }
    
    func test_GameScoreIsOneFifity_WhenPlayerPinsSpareThrought_GetsOneAdditionalFrame() {
        let app = XCUIApplication()
        XCUIApplication().activate()
        for _ in 1...21 {
            app.buttons["button_FivePin"].tap()
        }
        let labelFrameOneRollOne = app.staticTexts["label_FrameOneRollOne"]
        XCTAssertTrue(labelFrameOneRollOne.exists)
        XCTAssertEqual(labelFrameOneRollOne.label,"/")
        
        app.buttons["button_FinalScore"].tap()
        let labelFinalscoreStaticText = app.staticTexts["label_FinalScore"]
        XCTAssertEqual(labelFinalscoreStaticText.label, "Final Score: 150")
        app.buttons["button_Reset"].tap()
    }
}
