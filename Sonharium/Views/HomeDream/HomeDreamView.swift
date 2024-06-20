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
    @State private var editDream = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: MyDreamsView()) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.blue)
                }
                .buttonStyle(BorderlessButtonStyle())
                //
//                NavigationLink(destination: EditDreamView(dream)) {
//                    ZStack {
//                        Rectangle()
//                            .fill(.gray)
//                            .frame(width: 300, height: 500)
//                        Text("CARD COM O SONHO PREENCHIDO")
//                    }
//                }

                //
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }.padding()
                NavigationLink(destination: InfoDreamView()) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
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
