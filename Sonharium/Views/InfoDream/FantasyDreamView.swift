//
//  FantasyDreamView.swift
//  Sonharium
//
//  Created by Melissa Freire Guedes on 18/06/24.
//
// swiftlint: disable all
import SwiftUI

struct FantasyDreamView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                   Spacer()
                    ScrollView(.horizontal) {
                        HStack {
                            InfoCardView(label: "Lúcido", color: .lightPurple)
                            InfoCardView(label: "Vívido", color: .buttonDarkPurple)
                            InfoCardView(label: "Pesadelo", color: .lightPurple)
                            InfoCardView(label: "Habituais", color: .buttonDarkPurple)
                        }
                    }
                    Text("O que é ter um sonho vívido?")
                        .font(.system(size: 35, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundColor(.buttonDarkPurple)
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("O sonho vivido é uma experiência que\n ocorre durante o sono, na qual a pessoa\n tem a sensação de estar vivenciando uma situação real. Durante esse tipo de sonho, os sentidos e emoções são intensos, fazendo com que a pessoa sinta, veja, ouça e até mesmo cheire coisas que não estão presentes no ambiente físico.")
                        .font(.system(size: 19, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.buttonDarkPurple)
                        .multilineTextAlignment(.center)
                    InfoBeneficiosCardView(text: "Resolução de problemas")
                        .padding()
                    InfoBeneficiosCardView(text: "Melhora da memória")
                        
                }
            }
            .background(Color.background)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            InfoButtonView(label: "Sonhos", action: {})
                                .padding(5)
                            InfoButtonView(label: "Informações", action: {})
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Image(systemName: "magnifyingglass").font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(.buttonDarkPurple)
                            Image(systemName: "gear").font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(.buttonDarkPurple)
                        }
                    }
            }
        }
    }
}
#Preview {
    FantasyDreamView()
}
// swiftlint: enable all
