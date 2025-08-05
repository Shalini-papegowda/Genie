//
//  DashboardView.swift
//  Genie
//
//  Created by Shalini K P on 04/08/2025.
//

import SwiftUI

struct DashboardView: View {
    
    let genieModules: [GenieModule] = [
        GenieModule(icon: "🧥", title: "Outfit Genie", description: "AI-powered outfit suggestions, AR try-on", destination: AnyView(ContentView())),
        GenieModule(icon: "📅", title: "Planner Genie", description: "Smart task management, routines, reminders", destination: AnyView(ContentView())),
        GenieModule(icon: "🧘", title: "Wellness Genie", description: "Fitness tracking, breathing, habits, movement", destination: AnyView(ContentView())),
        GenieModule(icon: "💬", title: "Mr. Genie", description: "Chat-based mental wellness & mood tracking", destination: AnyView(ContentView()))
    ]
    
    var body: some View {
        GenieBackground {
            VStack(alignment: .leading) {
                HStack {
                    Text("Welcome back!")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "person.crop.circle")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(genieModules) { module in
                        DashboardModuleCell(module: module)
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    DashboardView()
}
