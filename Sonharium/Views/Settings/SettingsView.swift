//
//  CustomCellView.swift
//  Sonharium
//
//  Created by Gilberto Neto on 17/06/24.
//

import SwiftUI
import UIKit

struct CustomCellView: View {
    //
    var iconName: String
    var text: String
    //
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                //
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color("AccentColor"))
                    .frame(width: 30, height: 30)
                //
                Image(systemName: iconName)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
            } // fundo + ícone
            Text(text)   // texto Lembretes, Bloqueio, Sobre
                .font(.system(size: 17, design: .rounded))
            Spacer()
        }
    }
}
//
struct DetailView: View {
    //
    var text: String
    //
    var body: some View {
        Text("Detalhes sobre \(text)")
            .navigationTitle(text)
    }
}
// MUDAR COR DA NAVIGATIONBAR
func setupNavigationBarAppearance() {
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("AccentColor"))]
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("AccentColor"))]
}
//
struct ContentView: View {
    //
    @EnvironmentObject var authManager: AuthenticationManager
    //
    init() {
        setupNavigationBarAppearance()
    }
    //
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Notificações").foregroundColor(Color("AccentColor"))) {
                    NavigationLink(destination: DetailView(text: "Lembretes")) {
                        CustomCellView(iconName: "bell.fill", text: "Lembretes")
                            .frame(height: 30)
                    }
                }
                //
                Section(header: Text("Segurança").foregroundColor(Color("AccentColor"))) {
                    Toggle(isOn: $authManager.isFaceIDEnabled) {
                        CustomCellView(iconName: "lock.fill", text: "Bloqueio com Face ID")
                            .frame(height: 30)
                    }
                    .tint(Color("AccentColor"))
                }
                //
                Section(header: Text("Desenvolvimento").foregroundColor(Color("AccentColor"))) {
                    NavigationLink(destination: ContentView()) {
                        CustomCellView(iconName: "info.circle.fill", text: "Sobre")
                            .frame(height: 30)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color("fundo"))
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
