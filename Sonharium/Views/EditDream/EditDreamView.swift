//
//  EditDreamView.swift
//
//  Created by Marcelle Ribeiro Queiroz on 11/06/24.
//
// clica no card sonho -> modal/sheet do sonho -> pode VISUALIZAR e/ou EDITAR

import Foundation
import SwiftUI
import SwiftData

struct EditDreamView: View {
    //
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    //
    @State private var selectedStatus = Status.normalDream
    //
    @Bindable var dream: Dream
    //
    var body: some View {
        NavigationStack {
            //
            ZStack {
                // fundo roxo
                Image("fundo")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                //
                VStack(alignment: .center, spacing: 16) {
                    HStack(spacing: 8) {
                        //
                        VStack(alignment: .center) {
                            Text("Sonhei no dia...")
                                .font(.system(size: 17, design: .rounded))
                                .bold()
                                .foregroundStyle(Color.white)
                            DatePicker("",
                                       selection: $dream.dreamDate,
                                       displayedComponents: DatePickerComponents.date)
                            .padding(.trailing, 16)
                            .colorScheme(.dark)
                        } // sonhei no dia
                        .frame(width: 140)
                        // .border(Color.green)
                        //
                        VStack(alignment: .center) {
                            Text("Dormi às:")
                                .font(.system(size: 17, design: .rounded))
                                .bold()
                                .foregroundStyle(Color.white)
                            DatePicker("",
                                       selection: $dream.slept,
                                       displayedComponents: DatePickerComponents.hourAndMinute)
                            .padding(.trailing, 16)
                            .colorScheme(.dark)
                        } // dormi às
                        .frame(width: 100)
                        // .border(Color.green)
                        //
                        VStack(alignment: .center) {
                            Text("Acordei às:")
                                .font(.system(size: 17, design: .rounded))
                                .bold()
                                .foregroundStyle(Color.white)
                            DatePicker("",
                                       selection: $dream.wokeUp,
                                       displayedComponents: DatePickerComponents.hourAndMinute)
                            .padding(.trailing, 16)
                            .colorScheme(.dark)
                        }
                        .frame(width: 100)
                        // .border(Color.green)
                        //
                    } // DATA E HORAS
                    //
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color("fundoText"))
                            .frame(width: 360, height: 45)
                        //
                        TextField("Escolha um título para o seu sonho",
                                  text: $dream.title,
                                  axis: .vertical)
                            .font(.system(size: 17, design: .rounded))
                            .padding(8)
                            .frame(width: 350, height: 40, alignment: .leading)
                    } // TÍTULO
                    //
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color("fundoText"))
                            .frame(width: 360, height: 205)
                        //
                        TextField("O que aconteceu? Descreva como foi...",
                                  text: $dream.desc,
                                  axis: .vertical)
                            .font(.system(size: 17, design: .rounded))
                            .padding(8)
                            .frame(width: 350, height: 200, alignment: .topLeading)
                    } // DESCRIÇÃO
                    //
                    Text("Qual tipo de sonho você teve hoje?")
                        .font(.system(size: 17, design: .rounded))
                        .foregroundStyle(Color("fundoText"))
                        .bold()
                    VStack(spacing: 50) {
                        HStack(spacing: 24) {
                            // TIPOS DE SONHO
                            VStack(alignment: .leading) {
                                ForEach(Status.allCases, id: \.rawValue) { status in
                                    Button {
                                        selectedStatus = status
                                    } label: {
                                        Text(status.descr)
                                            .frame(width: 100, height: 32)
                                            .background {
                                                RoundedRectangle(cornerRadius: 8)
                                                    .fill(status == selectedStatus ? .purple : .white)
                                            }
                                            .foregroundStyle(status == selectedStatus ? .white : .black)
                                            .font(
                                                .system(
                                                    size: 17,
                                                    weight: status == selectedStatus ? .bold : .regular,
                                                    design: .rounded
                                                )
                                            )
                                    }
                                }
                            }
                            Image(systemName: selectedStatus.iconName) // MASCOTE
                                .font(.largeTitle)
                                .frame(width: 160, height: 152)
                                .background {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.purple)
                                }
                                .foregroundStyle(.white)
                        } // STATUS SONHO
                        HStack(spacing: 8) {
                            Button("Desenhar") {
                                // colocar ação DESENHAR
                            }
                            .buttonStyle(.borderedProminent)
                            //
                            Button("Gravar áudio") {
                                // colocar ação GRAVAR ÁUDIO
                            }
                            .buttonStyle(.borderedProminent)
                        } // DESENHAR + GRAVAR - BOTÕES
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Deletar") {
                            deleteDream()
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Salvar") {
                            updateDream()
                        }
                    }
                }  // DELETAR E SALVAR SONHO
            }
        }
    }
    //
    func updateDream() {       // FUNÇÃO SALVAR SONHO
        try? context.save()
        dismiss()
    }
    func deleteDream() {       // FUNÇÃO DELETAR SONHO
        context.delete(dream)
        dismiss()
    }
}
#Preview {
    Group {
        // swiftlint:disable force_try
        let container = try! ModelContainer(for: Dream.self, configurations: .init(isStoredInMemoryOnly: true))
        EditDreamView(
           dream: Dream.init(dreamDate: .now,
                           title: "titulo titulo titulo",
                           desc: "descriçao descriçao descriçao descriçao descriçao descriçao descriçao")
                       ).modelContainer(container)
    }
}
