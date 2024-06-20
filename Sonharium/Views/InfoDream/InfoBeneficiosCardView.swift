//
//  InfoBeneficiosCardView.swift
//  Sonharium
//
//  Created by Melissa Freire Guedes on 17/06/24.
//

import SwiftUI

struct InfoBeneficiosCardView: View {
    var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(.lightPurple)
                .frame(width: 349, height: 210)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.strokePurple, lineWidth: 5))
            Text(text)
                .fontWeight(.heavy)
                .padding(.bottom, 90)
                .font(.system(.title, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    InfoBeneficiosCardView(text: "Reduz a ansiedade")
}
