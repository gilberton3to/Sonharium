//
//  CustomCellView.swift
//  Sonharium
//
//  Created by Gilberto Neto on 17/06/24.
//

import SwiftUI
//import UIKit

struct CustomCellView: View {
    var iconName: String
    var text: String
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.purplesettings)
                    .frame(width: 30, height: 30)
                Image(systemName: iconName)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
            }
            Text(text)
            Spacer()
        }
    }
}

struct DetailView: View {
    var text: String
    var body: some View {
        Text("Detalhes sobre \(text)")
            .navigationTitle(text)
    }
}

func setupNavigationBarAppearance() {
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.purpletitle]
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.purpletitle]
}

struct ContentView: View {
    @EnvironmentObject var authManager: AuthenticationManager

    init() {
        setupNavigationBarAppearance()
    }

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Notificações").foregroundColor(.purplesettings)) {
                    NavigationLink(destination: DetailView(text: "Lembretes")) {
                        CustomCellView(iconName: "bell.fill", text: "Lembretes")
                            .frame(height: 30)
                    }
                }
                Section(header: Text("Segurança").foregroundColor(.purplesettings)) {
                    Toggle(isOn: $authManager.isFaceIDEnabled) {
                        CustomCellView(iconName: "lock.fill", text: "Bloqueio com Face ID")
                            .frame(height: 30)
                    }
                    .tint(.purplesettings)
                }
                Section(header: Text("Desenvolvimento").foregroundColor(.purplesettings)) {
                    NavigationLink(destination: ContentViewTwo()) {
                        CustomCellView(iconName: "info.circle.fill", text: "Sobre")
                            .frame(height: 30)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(.purplelight)
            .navigationTitle("Configurações")
            .scrollDisabled(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthenticationManager())
    }
}

//        .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//                Button {
//                    dismiss()
//                } label: {
//                    Label("Voltar", systemImage: "chevron.left")
//                        .bold()
//                        .labelStyle(.iconOnly)
//                }
//                .buttonStyle(.borderless)
//            }
//        }
