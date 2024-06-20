//
//  InfoCardView.swift
//  Sonharium
//
//  Created by Melissa Freire Guedes on 17/06/24.
//

import SwiftUI

struct InfoCardView: View {
    let label: String
    let color: Color
    var body: some View {
        VStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(color)
                .frame(width: 110, height: 110)
            Text(label).fontWeight(.heavy)
                .foregroundStyle(.buttonDarkPurple)
        }
    }
}

#Preview {
    InfoCardView(label: "Lúcido", color: .lightPurple)
}
