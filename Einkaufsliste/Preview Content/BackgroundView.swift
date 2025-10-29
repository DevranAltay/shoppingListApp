//
//  BackgroundView.swift
//  Einkaufsliste
//
//  Created by Devran Altay on 21.03.25.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [.white, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
