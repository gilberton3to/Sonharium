//
//  CalendarioView.swift
//  Sonharium
//
//  Created by Melissa Freire Guedes on 24/06/24.
//

//import SwiftUI
//import CalendarWeek
//
//struct CalendarioView: View {
//
//    let cards: [Card] = Array(-3...2).map {
//        Card(text: "Card 2", day: Day(from: .now.addingTimeInterval(600*24 * Double($0))))
//    }
//
//    var body: some View {
//        CalendarView(
//            models: cards,
//            daySpacing: 20,
//            headerView: { day in
//                HeaderView(selectedDay: day)
//            },
//            dayView: { day in
//                DayComponentView(day: day)
//            },
//            weekBackground: {
//                RoundedRectangle(cornerRadius: 20).fill(Color.pink.opacity(0.25))
//            },
//            dayContentView: {
//                CardView(model: $0)
//            },
//            dayEmptyStateView: {
//                EmptyCardView()
//            }
//        )
//    }
//
//}
//
//#Preview {
//    CalendarioView()
//}
//
//// MARK: - Modelo utilizado pra representar conteúdo atrelado a um dia do calendario
//
//// TODO: Mudar modelo e manter assinatura do protocolo CalendarModel e variavel day (IMPORTANTE)
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
//
//
//// MARK: - Views de Exemplo! Modificar e colocar em arquivos separados
//
//// TODO: Mudar view que mostra título da semana.
//// No caso, ta mostrando mes e ano.
//struct HeaderView: View {
//
//    let selectedDay: Day
//
//    var body: some View {
//        Text("\(selectedDay.month) \(selectedDay.year)".uppercased())
//            .bold()
//    }
//
//}
//
//// TODO: Mudar view que mostra dias
//// usar viewModel.modelExists(for: day) pra ver se tem card para o dia (day)
//// usar viewModel.selectedDay == day pra ver se o dia selecionado é o que ta sendo recarregado
//struct DayComponentView: View {
//
//    @Environment(CalendarViewModel<Card>.self) var viewModel
//
//    let day: Day
//
//    var body: some View {
//        VStack(spacing: 10) {
//            Text("\(day.number)")
//                .foregroundStyle(viewModel.modelExists(for: day) ? .black : .pink)
//                .bold(viewModel.selectedDay == day)
//                .background {
//                    Circle()
//                        .fill(.white)
//                        .frame(width: 30, height: 30)
//                        .opacity(day == viewModel.selectedDay ? 1 : 0)
//                }
//
//            Text(day.weekDay.description)
//                .font(.caption)
//                .fontWeight(.light)
//        }
//        .foregroundStyle(.pink)
//    }
//}
//
//// TODO: Mudar view do Card quando NAO tem conteudo
//struct EmptyCardView: View {
//    var body: some View {
//        Text("Nada aqui...")
//            .containerRelativeFrame(.horizontal)
//            .frame(maxHeight: .infinity)
//            .foregroundStyle(.gray)
//            .background {
//                RoundedRectangle(cornerRadius: 11).fill(Color(white: 0.95))
//            }
//    }
//}
//
//// TODO: Mudar view do Card quando tem conteudo
//struct CardView: View {
//
//    @Environment(CalendarViewModel<Card>.self) var viewModel
//
//    let model: Card
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
//}
