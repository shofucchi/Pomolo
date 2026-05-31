//
//  RootView.swift
//  Pomolo
//
//  Created by Shota Fuchikami on 2026/05/27.
//

import SFSafeSymbols
import SwiftUI

struct RootView: View {
    @State private var selectedTab: Tab = .timer

    var body: some View {
        TabView(selection: $selectedTab) {

            ForEach(Tab.allCases, id: \.self) { tab in
                NavigationStack {
                    Group {
                        switch tab {
                        case .timer: TimerView(tab: tab)
                        case .editScene: EditSceneView(tab: tab)
                        case .settings: SettingsView(tab: tab)
                        }
                    }
                }
                .tabItem {
                    Label(tab.title, systemImage: tab.icon.rawValue)
                }
                .tag(tab)
            }

        }
        .tint(.brandMain)
    }
}

#Preview {
    RootView()
}

enum Tab: CaseIterable {
    case timer
    case editScene
    case settings

    var title: String {
        switch self {
        case .timer: return "タイマー"
        case .editScene: return "編集"
        case .settings: return "設定"
        }
    }

    var icon: SFSymbol {
        switch self {
        case .timer: return .timer
        case .editScene: return .pencil
        case .settings: return .gear
        }
    }
}
