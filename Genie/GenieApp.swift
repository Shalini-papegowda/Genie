//
//  GenieApp.swift
//  Genie
//
//  Created by Shalini K P on 13/07/2025.
//

import SwiftUI
import CoreData

@main
struct GenieApp: App {
    let persistenceController = PersistenceController.shared
    @State private var showLaunch = true

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                
//            if showLaunch {
//                WelcomeView()
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                            withAnimation {
//                                showLaunch = false
//                            }
//                        }
//                    }
//            } else {
//                ContentView()
//                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            }
        }
    }
}

