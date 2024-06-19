//
//  AboutDevelopers.swift
//  Sonharium
//
//  Created by Gilberto Neto on 18/06/24.
//

import SwiftUI

struct CustomCellViewTwo: View {
    let profileImage: String
    var name: String
    var body: some View {
            HStack {
                Image(profileImage)
                    .resizable()
                    .cornerRadius(50)
                    .frame(width: 31, height: 31)
                Text(name)
                Spacer()
            }
    }
}

struct ContentViewTwo: View {
    @Environment(\.dismiss) var dismiss
    init() {
            setupNavigationBarAppearance()
        }
    var body: some View {
                List {
                    Section(header: Text("Desenvolvedores").foregroundColor(.purplesettings)) {
                            CustomCellViewTwo(profileImage: "gil", name: "Gilberto Neto")
                                .frame(height: 30)
                            CustomCellViewTwo(profileImage: "marcelle", name: "Marcelle Queiroz")
                                .frame(height: 30)
                            CustomCellViewTwo(profileImage: "melissa", name: "Melissa Guedes")
                                .frame(height: 30)
                            CustomCellViewTwo(profileImage: "rafi", name: "Rafí Teixeira")
                                .frame(height: 30)
                        }
                    Section(header: Text("App").foregroundColor(.purplesettings)) {
                                    CustomCellView(iconName: "star.fill", text: "Escreva uma avaliação")
                                        .frame(height: 30)
                    }
                    Section(header: Text("Mais informações").foregroundColor(.purplesettings)) {
                        CustomCellView(iconName: "at.circle.fill", text: "Site")
                            .frame(height: 30)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Sobre")
//                .navigationBarBackButtonHidden()
                .scrollContentBackground(.hidden)
                .background(.purplelight)
                .scrollDisabled(true)
    }
}

#Preview {
    ContentViewTwo().environmentObject(AuthenticationManager())
}
