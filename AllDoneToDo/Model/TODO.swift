//
//  TODO.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/28.
//

import FirebaseFirestore

struct TODO: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let ownerUID: String
    var title: String
    var description: String
    var TODOType: String
    var completed: Bool
    var documentID: String? = ""
        
    func getType() -> SelectedButton {
        if TODOType == "Groceries" {
            return .groceries
        } else if TODOType == "Work" {
            return .work
        } else if TODOType == "School" {
            return .school
        } else if TODOType == "Home" {
            return .home
        } else if TODOType == "Personal" {
            return .personal
        } else {
            return .extra
        }
    }
}
