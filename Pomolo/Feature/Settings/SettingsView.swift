//
//  SettingsView.swift
//  Pomolo
//
//  Created by Shota Fuchikami on 2026/05/27.
//

import SwiftUI

struct SettingsView: View {

    let tab: Tab

    var body: some View {
        Text("SettingsView")
            .navigationTitle(tab.title)
    }
}

#Preview {
    SettingsView(tab: .settings)
}
