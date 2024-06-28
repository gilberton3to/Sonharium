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
        ZStack {
            LinearGradient(stops: [
                .init(color: .fundo, location: 0.90),
                .init(color: .accentColor, location: 1.03)
            ], startPoint: .bottom, endPoint: .top)
            .ignoresSafeArea()
            List {
                Section(header: Text("Desenvolvedores").foregroundColor(.standard)) {
                    CustomCellViewTwo(profileImage: "gil", name: "Gilberto Neto")
                        .frame(height: 30)
                        .onTapGesture {
                            openURL(urlString: "https://www.linkedin.com/in/gilberto-neto21/")
                        }
                    CustomCellViewTwo(profileImage: "marcelle", name: "Marcelle Queiroz")
                        .frame(height: 30)
                        .onTapGesture {
                            openURL(urlString: "https://www.linkedin.com/in/marcellerq/")
                        }
                    CustomCellViewTwo(profileImage: "melissa", name: "Melissa Guedes")
                        .frame(height: 30)
                        .onTapGesture {
                            openURL(urlString: "https://www.linkedin.com/in/melissa-guedes-a05560216/")
                        }
                    CustomCellViewTwo(profileImage: "rafi", name: "Rafí Teixeira")
                        .frame(height: 30)
                        .onTapGesture {
                            openURL(urlString: "https://br.linkedin.com/in/rafaelaateixxeira")
                        }
                }
                Section(header: Text("App").foregroundColor(.accentColor)) {
                    CustomCellView(iconName: "star.fill", text: "Escreva uma avaliação")
                        .frame(height: 30)
                }
                Section(header: Text("Mais informações").foregroundColor(.accentColor)) {
                    CustomCellView(iconName: "globe", text: "Site")
                        .frame(height: 30)
                        .onTapGesture {
                            openURL(urlString: "https://readymag.website/u4147325997/sonharium/")
                        }
                }
            }
        }
        .navigationTitle("Sobre")
        .navigationBarTitleDisplayMode(.inline)
//                .navigationBarBackButtonHidden()
        .scrollContentBackground(.hidden)
        .background(.fundo)
        .scrollDisabled(false)
    }
}

func openURL(urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }

#Preview {
    ContentViewTwo()
        .environmentObject(AuthenticationManager())
}
