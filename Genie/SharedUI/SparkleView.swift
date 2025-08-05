//
//  SparkleView.swift
//  Genie
//
//  Created by Shalini K P on 05/08/2025.
//

import SwiftUI

struct Sparkle: View {
    let systemSize: CGFloat
    let color: Color
    let offset: CGSize
    let delay: Double
    
    @State private var animate = false
    
    var body: some View {
        Image(systemName: "sparkle")
            .font(.system(size: systemSize))
            .foregroundColor(color)
            .opacity(animate ? 1 : 0.2)
            .scaleEffect(animate ? 1.3 : 0.8)
            .offset(offset)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: true)
                    .delay(delay)
                ) {
                    animate = true
                }
            }
    }
}
