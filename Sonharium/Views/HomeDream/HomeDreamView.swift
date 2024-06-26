//
//  HomeDreamView.swift
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
            GeometryReader { proxy in
                VStack {
                    // CALENDÁRIO
                    CalendarView(
                        contentMargins: proxy.size.width * 0.097,
                        weekDaySpacing: proxy.size.width * 0.05
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
                .background(Color.fundo.ignoresSafeArea())
            }
        }
        .navigationBarBackButtonHidden()
        .onChange(of: dreams, initial: true) { _, newValue in
            Task {
                viewModel.models = newValue
                viewModel.selectedDay = viewModel.models.isEmpty ? Day(from: .now) : viewModel.models.last?.day
            }
        }
    }
}
#Preview {
    HomeDreamView()
        .environmentObject(AuthenticationManager())
        .modelContainer(for: Dream.self, inMemory: true)
}
