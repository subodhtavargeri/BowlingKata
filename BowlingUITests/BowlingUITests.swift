import XCTest

class BowlingUITests: XCTestCase {
    
    func test_PlayGame_WithFinalScoreTwelve() {
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
    
    func test_PlayGame_WithPerfectScore_StrikeThroughOut() {
        let app = XCUIApplication()
        let labelFinalscoreStaticText = app.staticTexts["label_FinalScore"]
        XCTAssertTrue(labelFinalscoreStaticText.exists)
        XCTAssertEqual(labelFinalscoreStaticText.label, "Final Score: 0")
        XCUIApplication().activate()
        for _ in 1...12 {
            app.buttons["button_TenPin"].tap()
        }
        app.buttons["button_FinalScore"].tap()
        XCTAssertEqual(labelFinalscoreStaticText.label, "Final Score: 300")
    }
}
