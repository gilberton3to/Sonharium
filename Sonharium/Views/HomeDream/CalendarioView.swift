import SwiftUI
import SwiftData
import CalendarWeek

extension Dream: CalendarModel {
    var day: Day {
        Day(from: dreamDate)
    }
}

struct CalendarioView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \Dream.dreamDate, order: .reverse) private var dreams: [Dream]

    @State var viewModel = CalendarViewModel<Dream>(models: [])

    @State private var createNewDream = false
    var body: some View {
        NavigationStack {
            VStack {
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
                    EmptyCardView()
                }
                .environment(viewModel)

                Button("Tive um sonho!") {
                    createNewDream = true
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $createNewDream) {
                    // on dismiss
                } content: {
                    AddDreamView(audio: AudioRecorder())
                        .presentationDetents([.large])
                }
            }
            .background(.fundo)
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
        .onChange(of: dreams, initial: true) { _, newValue in
            viewModel.models = newValue
        }
    }
}
#Preview {
    CalendarioView()
}

// MARK: - Modelo utilizado pra representar conteúdo atrelado a um dia do calendario

// TODO: Mudar modelo e manter assinatura do protocolo CalendarModel e variavel day (IMPORTANTE)
//class Card: Identifiable, CalendarModel {
//    let text: String
//    let day: Day
//    let dream: Dream
//
//    init(text: String, day: Day, dream: Dream) {
//        self.text = text
//        self.day = day
//        self.dream = dream
//    }
//}
// MARK: - Views de Exemplo! Modificar e colocar em arquivos separados

// TODO: Mudar view que mostra título da semana.
// No caso, ta mostrando mes e ano.
struct HeaderView: View {

    let selectedDay: Day

    var body: some View {
        Text("\(selectedDay.month) \(selectedDay.year)".uppercased())
            .bold()
    }

}

// TODO: Mudar view que mostra dias
// usar viewModel.modelExists(for: day) pra ver se tem card para o dia (day)
// usar viewModel.selectedDay == day pra ver se o dia selecionado é o que ta sendo recarregado
struct DayComponentView: View {

    @Environment(CalendarViewModel<Dream>.self) var viewModel

    let day: Day

    var body: some View {
        VStack(spacing: 10) {
            Text("\(day.number)")
                .foregroundStyle(viewModel.modelExists(for: day) ? .fundo : .gray)
                .fontWeight(.semibold)
                .bold(viewModel.selectedDay == day)
                .background {
                    Circle()
                        .fill(.fundo)
                        .frame(width: 30, height: 30)
                        .opacity(day == viewModel.selectedDay ? 1 : 0)
                }

            Text(day.weekDay.description)
                .font(.caption)
                .fontWeight(.light)
        }
        .foregroundStyle(.standard)
    }
}

// TODO: Mudar view do Card quando NAO tem conteudo
struct EmptyCardView: View {
    var body: some View {
        Text("Nada aqui...")
            .containerRelativeFrame(.horizontal)
            .frame(maxHeight: .infinity)
            .foregroundStyle(.gray)
            .background {
                RoundedRectangle(cornerRadius: 11).fill(Color(white: 0.95))
        }
    }
}
// TODO: Mudar view do Card quando tem conteudo
// struct DreamCardView: View {
//
//    @Environment(CalendarViewModel<Card>.self) var viewModel
//
//    let model: Dream
//
//    var body: some View {
//        VStack {
//            Text(model.day.date.formatted(date: .abbreviated, time: .shortened))
//            Text(model.text)
//        }
//        .bold(model.day == viewModel.selectedDay)
//        .containerRelativeFrame(.horizontal)
//        .frame(maxHeight: .infinity)
//        .background {
//            RoundedRectangle(cornerRadius: 11).fill(Color(white: 0.9))
//        }
//    }
// }
