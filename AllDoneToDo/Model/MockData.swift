//
//  MockData.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/28.
//

import Foundation

let appUser01 = AppUser(id: "1", uid: "1", firstName: "ジョン", lastName: "パーカー", email: "test01@example.com")

let todo01 = TODO(id: "1", ownerUID: "1", title: "Tomatoes", description: "Must be from Publix", TODOType: "Groceries", completed: false)
let todo02 = TODO(id: "2", ownerUID: "3", title: "Meat", description: "Clean Meat", TODOType: "Groceries", completed: true)
let todo03 = TODO(id: "2", ownerUID: "3", title: "Do Homework", description: "", TODOType: "School", completed: false)
