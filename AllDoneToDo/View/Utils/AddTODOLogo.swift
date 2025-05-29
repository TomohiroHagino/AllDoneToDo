//
//  AddTODOLogo.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/28.
//

import SwiftUI

struct AddTODOLogo: View {
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Image("LoginLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .background(colorScheme == .dark ? .black : .clear)
                .cornerRadius(80)
            
            Text("TODOを追加してください")
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .font(.system(size: 25))
                .fontWeight(.semibold)
            
        }
    }
}

#Preview {
    AddTODOLogo()
}
