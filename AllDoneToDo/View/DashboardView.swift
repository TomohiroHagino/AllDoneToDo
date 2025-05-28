//
//  DashBoardView.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/28.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    var body: some View {
        VStack {
            Text("だっしゅぼ〜ど")
            Button {
                AuthViewModel.shared.signout()
            } label: {
                Text("log out")
            }
        }
    }
}

#Preview {
    //    モックデータを使ってプレビューを表示させればよい
    DashboardView(user: appUser01)
}
