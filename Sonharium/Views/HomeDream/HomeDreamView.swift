//
//  AddDreamView.swift
//
//  Created by Marcelle Ribeiro Queiroz on 10/06/24.
//

import SwiftUI
import SwiftData

struct HomeDreamView: View {
    //
    @EnvironmentObject var authManager: AuthenticationManager
    //
    @Query(sort: \Dream.dreamDate, order: .reverse) private var dreams: [Dream]
    //
    @State private var createNewDream = false
    @State private var editDream = false
    @State private var dreamSelected: Dream?
    //
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 150) {
                    NavigationLink(destination: InfoDreamView()) {
                        Text("Informações")
                    }
                    .buttonStyle(.borderedProminent)
                    //
                    HStack(spacing: 16) {
                        NavigationLink(destination: MyDreamsView()) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.blue)
                        }
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.blue)
                        }
                    }
                }
                // CALENDÁRIO
                ScrollView(.horizontal) {
                    HStack(spacing: 8) {
                        ForEach(dreams) { dream in
                                Button {
                                   dreamSelected = dream
                                } label: {
                                    DreamCardView(dream: dream)
                                }
                        }
                    }
                } // CARDS DOS SONHOS
                //
                Button("Tive um sonho!") {
                    createNewDream = true
                }
                .buttonStyle(.borderedProminent)
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
