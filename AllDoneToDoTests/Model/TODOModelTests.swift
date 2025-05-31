//
//  TODOModelTests.swift
//  AllDoneToDoTests
//
//  Created by Tomohiro Hagino on 2025/05/31.
//

import XCTest
@testable import AllDoneToDo

final class TODOModelTests: XCTestCase {

    func testTODOInitialization() {
        let todo = TODO(id: "123", ownerUID: "user1", title: "Task", description: "Do it", TODOType: "Work", completed: false)

        XCTAssertEqual(todo.id, "123")
        XCTAssertEqual(todo.ownerUID, "user1")
        XCTAssertEqual(todo.title, "Task")
        XCTAssertEqual(todo.description, "Do it")
        XCTAssertEqual(todo.TODOType, "Work")
        XCTAssertEqual(todo.completed, false)
    }

    func testTODOGetType() {
        let todo = TODO(id: "456", ownerUID: "user2", title: "Task", description: "", TODOType: "Home", completed: true)
        let type = todo.getType()
        XCTAssertEqual(type, .home)
    }

    func testTODOGetType_invalidTypeDefaultsToExtra() {
        let todo = TODO(id: "789", ownerUID: "user3", title: "Task", description: "", TODOType: "Unknown", completed: false)
        let type = todo.getType()
        XCTAssertEqual(type, .extra)
    }
}

