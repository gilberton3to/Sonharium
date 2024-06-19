//
//  AddDreamView.swift
//
//  Created by Marcelle Ribeiro Queiroz on 10/06/24.
//

import SwiftUI
import SwiftData

struct HomeDreamView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var createNewDream = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: MyDreamsView()) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.blue)
                }
                .buttonStyle(BorderlessButtonStyle())
                //
                ContentUnavailableView("Adicione um sonho", systemImage: "pencil")
                //
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }.padding()
                //
                Button("Tive um sonho!") {
                    createNewDream = true
                }
                .buttonStyle(.borderedProminent)
                // modal de criar novo sonho
                .sheet(isPresented: $createNewDream) {
                    AddDreamView()
                        .presentationDetents([.large])
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
#Preview {
    HomeDreamView()
        .environmentObject(AuthenticationManager())
        .modelContainer(for: Dream.self, inMemory: true)
}
