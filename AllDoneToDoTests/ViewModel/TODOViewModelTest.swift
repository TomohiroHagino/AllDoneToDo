//
//  ToDoViewModelTests.swift
//  AllDoneToDoTests
//
//  Created by Tomohiro Hagino on 2025/05/27.
//

import XCTest
@testable import AllDoneToDo

final class TODOViewModelTests: XCTestCase {
    func testTodosFiltered_withAllFilter_returnsAll() {
        let viewModel = TODOViewModel()
        viewModel.todos = [
            TODO(id: "1", ownerUID: "u", title: "A", description: "", TODOType: "Work", completed: false),
            TODO(id: "2", ownerUID: "u", title: "B", description: "", TODOType: "School", completed: false)
        ]
        viewModel.filterTODOSelected = .all
        viewModel.todosFiltered = viewModel.todos
        
        XCTAssertEqual(viewModel.todosFiltered.count, 2)
    }
}

