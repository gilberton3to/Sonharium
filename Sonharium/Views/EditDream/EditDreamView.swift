//
//  EditDreamView.swift
//
//  Created by Gilberto Neto on 17/06/24.
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
    @State private var showAlert = false
    @State private var createDrawDream = false
    //
    @Bindable var dream: Dream
    //
    
   // @State private var lines: [Line] = []
    
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
                                        dream.status = status
                                    } label: {
                                        Text(status.descr)
                                            .frame(width: 100, height: 32)
                                            .background {
                                                RoundedRectangle(cornerRadius: 8)
                                                    .fill(status == dream.status ? .purple : .white)
                                            }
                                            .foregroundStyle(status == dream.status ? .white : .black)
                                            .font(
                                                .system(
                                                    size: 17,
                                                    weight: status == dream.status ? .bold : .regular,
                                                    design: .rounded
                                                )
                                            )
                                    }
                                }
                            }
                            Image(systemName: dream.status.iconName) // MASCOTE
                                .font(.largeTitle)
                                .frame(width: 160, height: 152)
                                .background {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.purple)
                                }
                                .foregroundStyle(.white)
                        } // STATUS SONHO
//                        HStack(spacing: 8) {
//                            Button("Desenhar") {
//                                // colocar ação DESENHAR
//                            }
//                            .buttonStyle(.borderedProminent)
//                            //
//                            Button("Gravar áudio") {
//                                // colocar ação GRAVAR ÁUDIO
//                            }
//                            .buttonStyle(.borderedProminent)
//                        } // DESENHAR + GRAVAR - BOTÕES
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Deletar") {
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Deletar sonho"),
                                message: Text("Todos os dados deste sonho vão ser apagados do histórico."),
                                primaryButton: .default(
                                    Text("Cancelar"),
                                    action: cancelAlert
                                ),
                                secondaryButton: .destructive(
                                    Text("Deletar"),
                                    action: deleteDream
                                )
                            )
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Ok") {
                            updateDream()
                        }
                    }
                }  // DELETAR E SALVAR SONHO
            }
        }
    }
    
    //
    @MainActor
    func updateDream() { // FUNÇÃO SALVAR SONHO
//        let draw = ImageRenderer(content: DrawView(lines: lines)).uiImage?.pngData()
//        dream.draw = draw
        try? context.save()
        dismiss()
    }
    func deleteDream() {       // FUNÇÃO DELETAR SONHO
        context.delete(dream)
        dismiss()
    }
    func cancelAlert() {
        showAlert = false
    }
}
#Preview {
    Group {
        let container = try! ModelContainer(for: Dream.self, configurations: .init(isStoredInMemoryOnly: true))
        EditDreamView(
           dream: Dream.init(dreamDate: .now,
                           title: "titulo titulo titulo",
                           desc: "descriçao descriçao descriçao descriçao descriçao descriçao descriçao",
                             status: .nightmare
                            )
                       ).modelContainer(container)
    }
}
