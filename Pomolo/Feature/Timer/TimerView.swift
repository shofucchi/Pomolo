//
//  ContentView.swift
//  Pomolo
//
//  Created by Shota Fuchikami on 2026/05/23.
//

import SwiftUI

struct TimerView: View {

    let tab: Tab

    var body: some View {
        Text("TimerView")
            .navigationTitle(tab.title)
            .toolbar(.hidden, for: .navigationBar)
    }

}

#Preview {
    TimerView(tab: .timer)
}
