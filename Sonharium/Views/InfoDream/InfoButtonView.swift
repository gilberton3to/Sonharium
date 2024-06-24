//
//  InfoButtonView.swift
//  Sonharium
//
//  Created by Melissa Freire Guedes on 17/06/24.
//

import SwiftUI

struct InfoButtonView: View {
    let label: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(label).font(.system(size: 12, weight: .semibold, design: .rounded))
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.small)
        .cornerRadius(40)
        .foregroundColor(.white)
        .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.standard, lineWidth: 4)
                )
    }
}
#Preview {
    InfoButtonView(label: "Informações", action: {})
}
