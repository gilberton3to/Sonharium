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
            ZStack {
                LinearGradient(stops: [
                    .init(color: .fundo, location: 0.90),
                    .init(color: .fundoGradiente, location: 1.02)
                ], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
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
                        RoundedRectangle(cornerRadius: 20).fill(Color.card)
                            .stroke(Color.standard, lineWidth: 2)
                    } dayContentView: { dream in
                        DreamCardView(dream: dream)
                            .onTapGesture {
                                dreamSelected = dream
                            }
                    } dayEmptyStateView: {
                        DreamCardView(dream: nil)
                    }
                    .environment(viewModel)
                    ZStack {
                        RoundedRectangle(cornerRadius: 60)
                            .foregroundStyle(Color.accentColor)
                            .frame(width: 190)
                            .frame(height: 60)
                        Button("Tive um sonho!") {
                            createNewDream = true
                        }
                        .foregroundStyle(Color.white)
                        .fontDesign(.rounded)
                        .fontWeight(.semibold)
                        .font(.system(size: 23))
                        .sheet(isPresented: $createNewDream) {
                            AddDreamView(audio: AudioRecorder())
                                .presentationDetents([.large])
                        }
                    }.padding(.bottom, 30)
                        .toolbar {
                            HStack(spacing: 17) {
                                NavigationLink(destination: MyDreamsView()) {
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .fontWeight(.medium)
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(.standard)
                                } // PESQUISA
                                NavigationLink(destination: ContentView()) {
                                    Image(systemName: "gearshape")
                                        .resizable()
                                        .fontWeight(.medium)
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(.standard)
                                } // CONFIGURAÇÕES
                            }
                        }// MODAL CRIAR SONHO
                }
                }
                .background(Color.clear.ignoresSafeArea())
                .sheet(item: $dreamSelected) { dream in
                    EditDreamView(dream: dream)
                        .presentationDetents([.large])
                }
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
