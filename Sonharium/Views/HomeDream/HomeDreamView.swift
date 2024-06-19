//
//  AddDreamView.swift
//
//  Created by Marcelle Ribeiro Queiroz on 10/06/24.
//

import SwiftUI
import SwiftData

struct HomeDreamView: View {
    @State private var createNewDream = false
    @State private var editDream = false
    var body: some View {
        NavigationStack {
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
    }
}
#Preview {
    HomeDreamView()
        .modelContainer(for: Dream.self, inMemory: true)
}
