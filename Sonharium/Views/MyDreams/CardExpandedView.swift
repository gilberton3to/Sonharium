//
//  CardExpandedView.swift
//  Sonharium
//
//  Created by Marcelle Ribeiro Queiroz on 18/06/24.
//

import Foundation
import SwiftUI
import SwiftData

struct CardExpandedView: View {
    //
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    //
    @State private var dreamDate = Date()
    //
    var closedRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    //
    @State private var title = ""
    @State private var desc = ""
    @State private var status = Status.normalDream
    // conseguir mudar propriedades(cor) do SegmentedPicker - pelo init()
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "roxo")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    //
    var body: some View {
        NavigationStack {
            //
            ZStack {
                // fundo roxo
                Rectangle()
                    .fill(Color("fundoAddDream"))
                    .ignoresSafeArea(.all)
                //
                VStack {
                    DatePicker("Sonhei no dia...", selection: $dreamDate,
                               displayedComponents: DatePickerComponents.date)
                        .bold()
                        .font(.title3)
                        .foregroundStyle(Color("fundoText"))
                        .frame(width: 350, height: 50)
                    //
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color("fundoText"))
                            .frame(width: 360, height: 45)
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
                        .frame(width: 393, height: 40)
                        .bold()
                    //
                    Picker("", selection: $status) {
                        ForEach(Status.allCases) { status in
                            Text(status.descr).tag(status)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 350, height: 28, alignment: .center)
                    //
                    Image("mascote")
                        // .background(Color.pink) // TIRAR
                        .frame(width: 150, height: 150, alignment: .center)
                    //
                    HStack {
                        Button("Gerar imagem do sonho") {
                            // colocar a ação
                        }
                        .buttonStyle(.borderedProminent)
                        //
                        Button("Gravar") {
                            // colocar a ação
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
    func addDream() {  // função de criar um novo soho
        let newDream = Dream(
            dreamDate: dreamDate,
            title: title,
            desc: desc,
            status: status)
        context.insert(newDream) // adiciona o sonho no data context
        dismiss()
    }
}
#Preview {
    CardExpandedView()
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
