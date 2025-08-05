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
            GenieBackground {
                VStack {
                    Spacer()
                    Text("Hey, Genie here🧞‍♂️")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.bottom, 2)
                    
                    Text("Your personal magician!")
                        .font(.headline)
                        .foregroundColor(.genieGold)
                        .contrast(0.8)
                    Spacer()
                    
                    ZStack {
                        Image(systemName: "wand.and.sparkles")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.genieGold)
                            .symbolRenderingMode(.palette)
                        
                        Sparkle(systemSize: 50, color: .genieGold, offset: CGSize(width: -60, height: -70), delay: 0)
                        Sparkle(systemSize: 28, color: .genieGold, offset: CGSize(width: 50, height: 0), delay: 0.45)
                        Sparkle(systemSize: 20, color: .white, offset: CGSize(width: -82, height: -25), delay: 0.3)
                        Sparkle(systemSize: 20, color: .white, offset: CGSize(width: -8, height: -80), delay: 0.6)
                        Sparkle(systemSize: 18, color: .white, offset: CGSize(width: -95, height: 40), delay: 0.45)
                        Sparkle(systemSize: 20, color: .white, offset: CGSize(width: 85, height: -55), delay: 0.45)
                        
                        Sparkle(systemSize: 18, color: .white, offset: CGSize(width: 10, height: 58), delay: 0.45)
                        Sparkle(systemSize: 18, color: .white, offset: CGSize(width: 50, height: -100), delay: 0.45)
                        Sparkle(systemSize: 18, color: .white, offset: CGSize(width: -40, height: 90), delay: 0.45)
                        Sparkle(systemSize: 18, color: .white, offset: CGSize(width: 100, height: 5), delay: 0.45)
                    }
                    Spacer()
                    
                    NavigationLink("Let's go!", destination: DashboardView())
                        .buttonStyle(.bordered)
                        .foregroundColor(.white)
                        .tint(.accent)
                        .font(.title)
                        .cornerRadius(20)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
