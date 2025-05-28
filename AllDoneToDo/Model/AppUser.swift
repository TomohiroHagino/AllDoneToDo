//
//  AppUser.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/28.
//

import FirebaseFirestore

struct AppUser: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let uid: String
    let firstName: String
    let lastName: String
    let email: String

    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == self.id
    }
}
