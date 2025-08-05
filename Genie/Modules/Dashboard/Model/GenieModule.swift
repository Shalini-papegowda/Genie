//
//  DashboardItems.swift
//  Genie
//
//  Created by Shalini K P on 05/08/2025.
//

import SwiftUI

struct GenieModule: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let description: String
    let destination: AnyView
}
