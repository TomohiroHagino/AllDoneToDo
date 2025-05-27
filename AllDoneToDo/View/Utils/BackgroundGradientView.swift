//
//  ContentView.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/27.
//

import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.blue,Color.blue.opacity(0.5)]
                ),
            startPoint: .top,
            endPoint: .bottom
        ).ignoresSafeArea()
    }
}

#Preview {
    BackgroundGradientView()
}
