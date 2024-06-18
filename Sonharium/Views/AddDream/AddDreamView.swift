//
//  AddDream.swift
//
//  Created by Marcelle Ribeiro Queiroz on 11/06/24.
//

import Foundation
import SwiftUI
import SwiftData

struct AddDreamView: View {
    //
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    //
    @State private var dreamDate = Date()
    @State private var slept = Date()
    @State private var wokeUp = Date()
    //
    var closedRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    //
    @State private var title = ""
    @State private var desc = ""
    @State private var selectedStatus = Status.normalDream
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
                                .font(.system(size: 17))
                                .bold()
                                .foregroundStyle(Color.white)
                            DatePicker("",
                                       selection: $dreamDate,
                                       displayedComponents: DatePickerComponents.date)
                            .padding(.trailing, 16)
                            .colorScheme(.dark)
                        }
                        .frame(width: 140)
                        // .border(Color.green)
                        //
                        VStack(alignment: .center) {
                            Text("Dormi às:")
                                .font(.system(size: 17))
                                .bold()
                                .foregroundStyle(Color.white)
                            DatePicker("",
                                       selection: $slept,
                                       displayedComponents: DatePickerComponents.hourAndMinute)
                            .padding(.trailing, 16)
                            .colorScheme(.dark)
                        }
                        .frame(width: 100)
                        // .border(Color.green)
                        //
                        VStack(alignment: .center) {
                            Text("Acordei às:")
                                .font(.system(size: 17))
                                .bold()
                                .foregroundStyle(Color.white)
                            DatePicker("",
                                       selection: $wokeUp,
                                       displayedComponents: DatePickerComponents.hourAndMinute)
                            .padding(.trailing, 16)
                            .colorScheme(.dark)
                        }
                        .frame(width: 100)
                        // .border(Color.green)
                        //
                    }
                    //
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color("fundoText"))
                            .frame(width: 360, height: 45)
                        //
                        TextField("Escolha um título para o seu sonho",
                                  text: $title,
                                  axis: .vertical)
                            .font(.system(size: 17))
                            .padding(8)
                            .frame(width: 350, height: 40, alignment: .leading)
                    }
                    //
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color("fundoText"))
                            .frame(width: 360, height: 205)
                        //
                        TextField("O que aconteceu? Descreva como foi...",
                                  text: $desc,
                                  axis: .vertical)
                            .font(.system(size: 17))
                            .padding(8)
                            .frame(width: 350, height: 200, alignment: .topLeading)
                    }
                    //
                    Text("Qual tipo de sonho você teve hoje?")
                        .font(.system(size: 17))
                        .foregroundStyle(Color("fundoText"))
                        .bold()
                    HStack(spacing: 24) {
                        // ButtonDream
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
                                                weight: status == selectedStatus ? .bold : .regular
                                            )
                                        )
                                }
                            }
                        }
                        //
                        Image(systemName: selectedStatus.iconName)
                            .font(.largeTitle)
                            .frame(width: 160, height: 152)
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.purple)
                            }
                            .foregroundStyle(.white)
                    }
                    //
                    VStack(spacing: 8) {
                        HStack(spacing: 35) {
                            Button("Desenhar") {
                                // colocar a ação
                            }
                            .buttonStyle(.borderedProminent)
                            //
                            Button("Gravar") {
                                // colocar a ação
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        Button("Gerar emoção do sonho") {
                            // colocar ação do botão
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancelar") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Criar sonho") {
                            addDream()
                        }
                    }
                }
            }
        }
    }
    //
    func addDream() {  // função de criar um novo soho
        let newDream = Dream(
            dreamDate: dreamDate,
            title: title,
            desc: desc,
            status: selectedStatus)
        context.insert(newDream) // adiciona o sonho no data context
        dismiss()
    }
}
#Preview {
    AddDreamView()
        .modelContainer(for: Dream.self, inMemory: true)
}
//    func addDream() {  // CRIA O SONHO
//        let dream = Dream(title: title, desc: desc, type: type)
//        context.insert(dream) //ADICIONA O SONHO NO data context
//    }
//    func deleteDream(_ dream: Dream) {
//        context.delete(dream) //DELETA O SONHO
//    }
//
//    func updateDream(_ dream: Dream) {   //EDITA O SONHO
//        dream.title = "Editar sonho"
//        try? context.save()    //SALVA O SONHO DEPOIS DE EDITAR
//    }
//
// pesquisar depois: public init
// conseguir mudar propriedades(cor) do SegmentedPicker - pelo init()
// init() {
//    UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "roxo")
//    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
// }
//
//   .colorScheme(.dark)
//   .background(Color.orange.opacity(0.2), in: RoundedRectangle(cornerRadius: 20))
//
//  init() {
// UIDatePicker.appearance().backgroundColor = UIColor(Color("roxo")) // changes bg color
// }
// Picker("", selection: $status) {
//    ForEach(Status.allCases) { status in
//        Text(status.descr).tag(status)
//    }
// }
// .pickerStyle(SegmentedPickerStyle())
// .frame(width: 350, height: 28, alignment: .center)
