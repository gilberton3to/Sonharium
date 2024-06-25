//
//  AddDreamView.swift
//
//  Created by Marcelle Ribeiro Queiroz on 10/06/24.
//

import SwiftUI
import SwiftData
import CalendarWeek
//
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
    @State var viewModel = CalendarViewModel<Dream>(models: [])
    //
    var body: some View {
        NavigationStack {
            VStack {
                // CALENDÁRIO
                CalendarView(
                    contentMargins: 50.0,
                    weekDaySpacing: 20
                ) { day in
                    HeaderView(selectedDay: day)
                } weekDayView: { day in
                    DayComponentView(day: day)
                } weekBackground: {
                    RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.9))
                } dayContentView: { dream in
                    DreamCardView(dream: dream)
                } dayEmptyStateView: {
                    DreamCardView(dream: nil)
                }
                .environment(viewModel)

                Button("Tive um sonho!") {
                    createNewDream = true
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $createNewDream) {
                    AddDreamView(audio: AudioRecorder())
                        .presentationDetents([.large])
                }
                .toolbar {
                    HStack(spacing: 16) {
                        NavigationLink(destination: MyDreamsView()) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.standard)
                        } // PESQUISA
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.standard)
                        } // CONFIGURAÇÕES
                    }
                }// MODAL CRIAR SONHO
            }
        }.navigationBarBackButtonHidden()
        .background(Color.fundo.ignoresSafeArea())
        .onChange(of: dreams, initial: true) { _, newValue in
            viewModel.models = newValue
        }
    }
}
#Preview {
    HomeDreamView()
        .environmentObject(AuthenticationManager())
        .modelContainer(for: Dream.self, inMemory: true)
}
