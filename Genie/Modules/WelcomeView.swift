//
//  SwiftUIView.swift
//  Genie
//
//  Created by Shalini K P on 14/07/2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("Genie")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .clipped()
                Text("Welcome to Genie")
                    .font(.largeTitle)
                Spacer()
            }
            .padding(20)
            
            .safeAreaInset(edge: .bottom) {
                    NavigationLink("Let's go!", destination: DashboardView())
                        .buttonStyle(.borderedProminent)
                        .padding()
                        .background(Color(UIColor.systemBackground))
                }
        }
    }
}

#Preview {
    WelcomeView()
}
