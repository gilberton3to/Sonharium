//
//  MyDreamsView.swift
//
//  Created by Marcelle Ribeiro Queiroz on 14/06/24.
//

import SwiftUI
import SwiftData

struct MyDreamsView: View {
    //
    @Environment(\.modelContext) private var modelContext
    //
    @Query(sort: \Dream.dreamDate, order: .reverse) private var dreams: [Dream]
    //
    @State var searchText: String = ""  // barra de pesquisa
    @State private var dreamSelected: Dream?
    //
    var body: some View {
        VStack(alignment: .center) {
            if dreams.isEmpty {
                NoDrems()
            } else {
                ZStack {
                    LinearGradient(stops: [
                        .init(color: .fundo, location: 0.90),
                        .init(color: .fundoGradiente, location: 1.02)
                    ], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                    List {
                        ForEach(filterDreams) { dream in
                            Button {
                                dreamSelected = dream
                            } label: {
                                MyDreamCardView(dream: dream)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
            }
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Pesquisar sonho")
        .sheet(item: $dreamSelected) { dream in
            EditDreamView(dream: dream)
                .presentationDetents([.large])
        }
        .navigationTitle("Meus Sonhos")
    }
    var filterDreams: [Dream] {
        if searchText.isEmpty { // se não pesquisar nada, mostrar a lista com todos os sonhos
            return dreams
        }
        return dreams.filter { // filtra por Título e Descrição
            $0.title.localizedCaseInsensitiveContains(searchText) || $0.desc.localizedCaseInsensitiveContains(searchText)  }
    }
}
#Preview {
    MyDreamsView()
        .modelContainer(for: Dream.self, inMemory: true)
}
// ANOTAÇÕES
// Query - select, pesquisa
// sort - ordenação .title (ordem alfabética)
// se não usar sort - exibe por ordem de inserção .forward
// ContentUnavailableView("Ainda não há sonho", systemImage: "cloud")
