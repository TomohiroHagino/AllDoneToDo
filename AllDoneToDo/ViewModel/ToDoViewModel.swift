//
//  AuthViewModel.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/28.
//

import SwiftUI
import Firebase

class TODOViewModel: ObservableObject {
    // 空のTODO配列を初期値として扱うという意味
    @Published var todos = [TODO]()
    // CreateTODOViewを見せる時にtrueにする
    @Published var showCreateTODOView: Bool = false
    @Published var filterTODOSelected: SelectedButton = .all
    @Published var todosFiltered = [TODO]()
    
    init() {
        loadTODOs()
    }
    
    func loadTODOs() {
        guard let user = AuthViewModel.shared.currentUser else { return }

        let query = COLLECTION_USERS.document(user.id ?? "").collection("to-dos").order(by: "completed")
        
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.todos = documents.compactMap({ try? $0.data(as: TODO.self)})
            
            for index in stride(from: 0, to: self.todos.count, by: 1) {
                self.todos[index].documentID = documents[index].documentID
            }
            self.todosFiltered = self.todos
            
            if self.filterTODOSelected != .all {
                self.todosFiltered = self.todos.filter { todo in
                    return todo.TODOType == self.filterTODOSelected.rawValue
                }
            }
        }
    }
    
    func uploadTODO(todo: TODO) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let data: [String: Any] = [
            "title": todo.title,
            "description": todo.description,
            "TODOType": todo.TODOType,
            "completed": todo.completed,
            "ownerUID": user.id ?? ""
        ]
        
        COLLECTION_USERS.document(user.id ?? "").collection("to-dos").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTODOs()
        }
    }
    
    func deleteTODO( v) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("to-dos").document(todoId).delete() { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTODOs()
        }
    }

    func completeTODO(todoId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("to-dos").document(todoId).updateData(["completed": true]) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTODOs()
        }
    }
    
    func uncompleteTODO(todoId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("to-dos").document(todoId).updateData(["completed": false]) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTODOs()
        }
    }
}
