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
    //
    var body: some View {
            NavigationStack {
                    VStack {
                            if dreams.isEmpty {
                                ContentUnavailableView("Ainda não há sonho", systemImage: "cloud")
                            } else {
                                List {
                                    ForEach(filterDreams) { dream in
                                        MyDreamCardView(dream: dream)
                                            .listRowSeparator(.hidden)
                                    }
                                }
                                .listStyle(.plain)
                                .searchable(text: $searchText,
                                            placement: .navigationBarDrawer(displayMode: .always),
                                            prompt: "Pesquisar sonho")
                            }
                    }
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
