import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    @State var searchText: String = ""
    @ObservedObject var viewModel = TODOViewModel()
    
    var body: some View {
        // フィルター済みのToDoを先に作っておく
        let filteredTodos = viewModel.todosFiltered.filter { todo in
            searchText.isEmpty ||
            todo.title.lowercased().contains(searchText.lowercased()) ||
            todo.description.lowercased().contains(searchText.lowercased())
        }
        
        return ZStack {
            VStack {
                // ヘッダー
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
                
                // 検索バー
                SearchBarView(searchText: $searchText)
                    .padding()
                
                // カテゴリーボタン
                TODOButtonStack(viewModel: viewModel)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                // 表示内容：フィルター後の件数に応じて切り替え
                if filteredTodos.isEmpty {
                    AddTODOLogo()
                        .padding(.top)
                } else {
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(filteredTodos, id: \.id) { todo in
                                TODOView(todo: todo, viewModel: viewModel)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .overlay {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            viewModel.showCreateTODOView = true
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .frame(width: 60, height: 60)
                                .background(Color("lightBlue"))
                                .cornerRadius(30)
                        }
                        .padding(20)
                    }
                }
            }
            
            if viewModel.showCreateTODOView {
                BlankView()
                CreateTODOView(
                    user: appUser01,
                    viewModel: viewModel
                )
            }
        }
    }
}

#Preview {
    DashboardView(user: appUser01)
}
