//
//  ContentView.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/27.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if viewModel.userSession == nil {
            LoginView()
        } else {
//            現状はuserが取得できないので、コメントアウトしておく
            if let user = viewModel.currentUser {
                DashboardView(user: user)
            }
        }
    }
}

#Preview {
    ContentView()
}
