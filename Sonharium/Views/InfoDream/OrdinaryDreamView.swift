//
//  OrdinaryDreamView.swift
//  Sonharium
//
//  Created by Melissa Freire Guedes on 18/06/24.
//

// swiftlint: disable all
//import SwiftUI
//
//struct OrdinaryView: View {
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(alignment: .center) {
//                   Spacer()
//                    ScrollView(.horizontal) {
//                        HStack {
//                            InfoCardView(label: "Lúcido", color: .lightPurple)
//                            InfoCardView(label: "Vívido", color: .buttonDarkPurple)
//                            InfoCardView(label: "Pesadelo", color: .lightPurple)
//                            InfoCardView(label: "Habituais", color: .buttonDarkPurple)
//                        }
//                    }
//                    Text("O que é ter um  sonho habitual? ")
//                        .font(.system(size: 35, design: .rounded))
//                        .fontWeight(.heavy)
//                        .foregroundColor(.buttonDarkPurple)
//                        .multilineTextAlignment(.center)
//                        .padding()
//                    Text("Os sonhos recorrentes são produzidos \ncom frequência durante períodos de estresse, embora haja pessoas que o experimentam durante anos ou até por toda\n a vida. Em alguns casos, eles desaparecem quando o estado de ânimo da pessoa melhora, mas reaparecem quando ele \nvolta a piorar.")
//                        .font(.system(size: 19, design: .rounded))
//                        .fontWeight(.semibold)
//                        .foregroundColor(.buttonDarkPurple)
//                        .multilineTextAlignment(.center)
//                    InfoBeneficiosCardView(text: "Insights pessoais")
//                        .padding()
//                    InfoBeneficiosCardView(text: "Ansiedade")
//                }
//            }
//            .background(Color.background)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    HStack {
//                        InfoButtonView(label: "Sonhos", action: {})
//                            .padding(5)
//                        InfoButtonView(label: "Informações", action: {})
//                    }
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    HStack {
//                        Image(systemName: "magnifyingglass").font(.system(size: 20, weight: .semibold, design: .rounded))
//                            .foregroundColor(.buttonDarkPurple)
//                        Image(systemName: "gear").font(.system(size: 20, weight: .semibold, design: .rounded))
//                            .foregroundColor(.buttonDarkPurple)
//                    }
//                }
//            }
//        }
//    }
//}
//#Preview {
//    OrdinaryView()
//}
//// swiftlint: enable all
