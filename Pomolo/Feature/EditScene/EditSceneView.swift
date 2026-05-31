//
//  EditSceneView.swift
//  Pomolo
//
//  Created by Shota Fuchikami on 2026/05/27.
//

import SwiftUI

struct EditSceneView: View {

    let tab: Tab

    var body: some View {
        Text("EditSceneView")
            .navigationTitle(tab.title)
    }
}

#Preview {
    EditSceneView(tab: .editScene)
}
