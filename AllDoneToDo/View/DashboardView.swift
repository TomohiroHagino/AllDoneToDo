//
//  DashBoardView.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/28.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    @State var searchText: String = ""
    @ObservedObject var viewModel = TODOViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("- AllDoneToDo - ")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    Spacer()
                }
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            AuthViewModel.shared.signout()
                        } label: {
                            Text("log out")
                                .foregroundColor(Color(.systemGray))
                                
                        }
                        .padding(.trailing)
                    }
                }
                SearchBarView(searchText: $searchText)
                    .padding()
            }
        }
    }
}

#Preview {
    //    モックデータを使ってプレビューを表示させればよい
    DashboardView(user: appUser01)
}
