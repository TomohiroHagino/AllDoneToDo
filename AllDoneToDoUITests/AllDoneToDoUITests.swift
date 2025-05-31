//
//  AllDoneToDoUITests.swift
//  AllDoneToDoUITests
//
//  Created by Tomohiro Hagino on 2025/05/27.
//

import XCTest

final class AllDoneToDoUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testLoginScreenElementsExist() throws {
        // 画面にTextFieldやButtonがあること
        XCTAssertTrue(app.textFields["emailTextField"].exists)
        XCTAssertTrue(app.secureTextFields["passwordSecureField"].exists)
        XCTAssertTrue(app.buttons["loginButton"].exists)
    }

    func testLoginFlow() throws {
        // 正しい情報でログインし、ダッシュボードが表示されること
        let email = app.textFields["emailTextField"]
        let password = app.secureTextFields["passwordSecureField"]
        let loginButton = app.buttons["loginButton"]
        
        email.tap()
        email.typeText("test@example.com")

        password.tap()
        password.typeText("password123")

        loginButton.tap()
        
        // ログイン成功後に表示されるべき要素があること
        XCTAssertTrue(app.staticTexts["- AllDoneToDo -"].waitForExistence(timeout: 5))
    }
}
