//
//  HomeListUITest.swift
//  Directory AppUITests
//
//  Created by shikha on 06/02/22.
//

import XCTest

class HomeListUITest: XCTestCase {

    func test_should_make_sure_controls_have_default_value()
    {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        let button1 = app.buttons["viewPeopleListButton"]
        XCTAssertEqual(button1.label, "View People List")
        
        let button2 = app.buttons["viewRoomListButton"]
        XCTAssertEqual(button2.label, "View Room List")
    }

}
