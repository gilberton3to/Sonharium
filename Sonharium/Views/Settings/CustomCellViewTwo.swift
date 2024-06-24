//
//  CustomCellViewTwo.swift
//  Sonharium
//
//  Created by Gilberto Neto on 18/06/24.
//

import SwiftUI
//
struct CustomCellViewTwo: View {
    //
    let profileImage: String
    var name: String
    //
    var body: some View {
            HStack {
                Image(profileImage)
                    .resizable()
                    .cornerRadius(50)
                    .frame(width: 31, height: 31)
                //
                Text(name)
                    .font(.system(size: 17, design: .rounded))
                Spacer()
            } // foto e nome
    }
}
//
struct ContentViewTwo: View {
    //
    @Environment(\.dismiss) var dismiss
    //
    init() {
            setupNavigationBarAppearance()
        }
    //
    var body: some View {
                List {
                    Section(header: Text("Desenvolvedores").foregroundColor(.standard)) {
                            CustomCellViewTwo(profileImage: "gil", name: "Gilberto Neto")
                                .frame(height: 30)
                            AboutView(profileImage: "marcelle", name: "Marcelle Queiroz")
                                .frame(height: 30)
                            AboutView(profileImage: "melissa", name: "Melissa Guedes")
                                .frame(height: 30)
                            AboutView(profileImage: "rafi", name: "Rafí Teixeira")
                                .frame(height: 30)
                        }
                    Section(header: Text("App").foregroundColor(.accentColor)) {
                                    CustomCellView(iconName: "star.fill", text: "Escreva uma avaliação")
                                        .frame(height: 30)
                    }
                    Section(header: Text("Mais informações").foregroundColor(.accentColor)) {
                        CustomCellView(iconName: "at.circle.fill", text: "Site")
                            .frame(height: 30)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Sobre")
                .navigationBarBackButtonHidden()
                .scrollContentBackground(.hidden)
                .background(.fundo)
                .scrollDisabled(true)
    }
}

#Preview {
    ContentViewTwo().environmentObject(AuthenticationManager())
}
