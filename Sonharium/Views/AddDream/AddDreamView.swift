//
//  AddDream.swift
//
//  Created by Marcelle Ribeiro Queiroz on 11/06/24.
//

import SwiftUI
import SwiftData

struct AddDreamView: View {
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
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "purple")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    //
    var body: some View {
        NavigationStack {
            //
            VStack {
                DatePicker("Sonhei no dia...", selection: $dreamDate, displayedComponents: DatePickerComponents.date)
                    .bold()
                    .frame(width: 350, height: 50)
                //
                TextField("Escolha um título para o seu sonho", text: $title)
                    .font(.system(size: 17))
                    .padding(8)
                    .frame(width: 350, height: 40, alignment: .leading)
                    // .background(Color.gray) // TIRAR
                //
                TextField("O que aconteceu? Descreva como foi...", text: $desc)
                    .font(.system(size: 17))
                    .padding(8)
                    .frame(width: 350, height: 200, alignment: .topLeading)
                    // .background(Color.gray) // TIRAR
                //
                Text("Qual tipo de sonho você teve hoje?")
                    .font(.system(size: 17))
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