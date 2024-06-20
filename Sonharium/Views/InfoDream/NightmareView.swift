//
//  NightmareView.swift
//  Sonharium
//
//  Created by Melissa Freire Guedes on 18/06/24.
//

// swiftlint: disable all
import SwiftUI

struct NightmareView: View {
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
                    Text("O que é ter um pesadelo? ")
                        .font(.system(size: 35, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundColor(.buttonDarkPurple)
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("Os pesadelos podem ser definidos como versões muito intensas de um sonho ruim. Sim, há uma diferença entre os dois. Um pesadelo é um sonho vívido com uma narrativa que pode ser ameaçadora e inquietante. Eles prejudicam o sono de \n quem passa por eles. Da mesma forma que os sonhos bons, os pesadelos acontecem geralmente durante o sono REM. Eles são intensos o suficiente para acordar uma pessoa. Já os sonhos ruins não têm esse poder.")
                        .font(.system(size: 19, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.buttonDarkPurple)
                        .multilineTextAlignment(.center)
                    InfoBeneficiosCardView(text: "Perturbação do sono")
                        .padding()
                    InfoBeneficiosCardView(text: "Estresse")
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
    NightmareView()
}
// swiftlint: enable all
