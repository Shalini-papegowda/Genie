//
//  GenieModuleView.swift
//  Genie
//
//  Created by Shalini K P on 05/08/2025.
//

import SwiftUI

struct DashboardModuleCell: View {
    let module: GenieModule
    
    var body: some View {
        NavigationLink(destination: module.destination) {
            VStack(alignment: .leading, spacing: 8) {
                Text(module.icon)
                    .font(.system(size: 40))
                
                Text(module.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(module.description)
                    .font(.subheadline)
                    .foregroundColor(.genieGold)
                    .contrast(0.8)
            }
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(16)
            .shadow(radius: 2)
        }
    }
}
