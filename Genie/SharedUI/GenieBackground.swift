//
//  GenieBackground.swift
//  Genie
//
//  Created by Shalini K P on 05/08/2025.
//

import SwiftUI

struct GenieBackground<Content: View>: View {
    let colors: [Color]
    let content: () -> Content
    
    init(colors: [Color] = [.accent, .accent, .genieGold.opacity(0.8)],
         @ViewBuilder content: @escaping () -> Content) {
        self.colors = colors
        self.content = content
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: colors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            content()
        }
    }
}

