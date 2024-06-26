import Foundation
import SwiftUI
import SwiftData

struct AddDreamView: View {
    //
    @ObservedObject var audio: AudioRecorder
    //
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    //
    @State private var showAlert = false
    @State private var createDrawDream = false
    @State private var infoDream = false
    //
    @State private var dreamDate = Date()
    @State private var slept = Date()
    @State private var wokeUp = Date()
    @State private var title = ""
    @State private var desc = ""
    @State private var selectedStatus = Status.normalDream
    @FocusState private var isFocused: Bool
    @FocusState private var descFocused: Bool
    //
    var closedRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    //
    var body: some View {
        NavigationStack {
            //
            ZStack {
                Color.fundoSheet
                    .ignoresSafeArea()
                ScrollView {
                    //
                    VStack(alignment: .center, spacing: 16) {
                        HStack(alignment: .center) {
                            //
                            VStack(alignment: .center) {
                                Text("Sonhei no dia:  ")
                                    .font(.system(size: 16, design: .rounded))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color("AccentColor"))
                                DatePicker("",
                                           selection: $dreamDate,
                                           displayedComponents: DatePickerComponents.date)
                            } // sonhei no dia
                            VStack(alignment: .center) {
                                Text("Dormi:")
                                    .font(.system(size: 16, design: .rounded))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color("AccentColor"))
                                DatePicker("",
                                           selection: $slept,
                                           displayedComponents: DatePickerComponents.hourAndMinute)
                            } // dormi às
                            VStack(alignment: .center) {
                                Text("Acordei:")
                                    .font(.system(size: 16, design: .rounded))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color("AccentColor"))
                                DatePicker("",
                                           selection: $wokeUp,
                                           displayedComponents: DatePickerComponents.hourAndMinute)
                            } // acordei às
                        }.padding(.horizontal)
                        // DATA E HORAS
                        //
                        Text("Escolha um título para o seu sonho:")
                            .font(.system(size: 17, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("AccentColor"))
                            .padding(.trailing, 63)
                            .padding(.bottom, -7)
                        //
                        ZStack {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color("TextFieldColor"))
                                .frame(width: 360, height: 45)
                                .focused($isFocused)
                                .onTapGesture {
                                    isFocused.toggle()
                                }
                            //
                            TextField("Título",
                                      text: $title,
                                      axis: .vertical)
                            .font(.system(size: 17, design: .rounded))
                            .foregroundStyle(.secondary)
                            .background(Color.clear)
                            .focused($isFocused)
                            .onTapGesture {
                                isFocused.toggle()
                            }
                            .padding(8)
                            .frame(width: 350, height: 40, alignment: .leading)
                        } // TÍTULO
                        //
                        Text("O que aconteceu? Descreva como foi:")
                            .font(.system(size: 17, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("AccentColor"))
                            .padding(.trailing, 40)
                            .padding(.bottom, -7)
                        //
                        ZStack {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color("TextFieldColor"))
                                .frame(width: 360, height: 205)
                                .focused($descFocused)
                                .onTapGesture {
                                    descFocused.toggle()
                                }
                            //
                            TextField("Descrição",
                                      text: $desc,
                                      axis: .vertical)
                            .font(.system(size: 17, design: .rounded))
                            .foregroundStyle(.secondary)
                            .background(Color.clear)
                            .focused($descFocused)
                            .onTapGesture {
                                descFocused.toggle()
                            }
                            .padding(8)
                            .frame(width: 350, height: 200, alignment: .topLeading)
                        } // DESCRIÇÃO
                        //
                        Text("Qual tipo de sonho você teve?")
                            .font(.system(size: 20, design: .rounded))
                            .foregroundStyle(Color("AccentColor"))
                            .fontWeight(.semibold)
                        //
                        VStack(spacing: 16) {
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
                                                        .fill(status == selectedStatus ? Color("AccentColor") : Color("TextFieldColor"))
                                                }
                                                .foregroundStyle(status == selectedStatus ? Color.white : Color("AccentColor"))
                                                .font(
                                                    .system(
                                                        size: 17,
                                                        weight: status == selectedStatus ? .semibold : .medium,
                                                        design: .rounded
                                                    )
                                                )
                                        }
                                    }
                                }
                                Image(selectedStatus.iconName)
                                    .resizable()
                                    .frame(width: 115, height: 100)
                                // MASCOTE
                                    .frame(width: 160, height: 152)
                                    .background {
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(.accent, lineWidth: 3)
                                            .fill(Color("TextFieldColor"))
                                    }
                                    .foregroundStyle(Color("AccentColor"))
                            } // STATUS SONHO
                            //
                            Button("Saiba mais sobre os tipos de sonho") {
                                infoDream = true
                            }
                            .padding()
                            .buttonStyle(.bordered)
                            .sheet(isPresented: $infoDream) {
                                InfoDreamView()
                                    .presentationDetents([.large])
                            }
                        }
                    }
                    .frame(maxWidth: 370, maxHeight: .infinity, alignment: .top)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Novo sonho")
                    .padding(.top, 14)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Cancelar") {
                                dismiss()
                            }
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Criar") {
                                addDream()
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Não foi possível registrar sonho."),
                                    message: Text("Preencha com um título " +
                                                  "e uma descrição.")
                                )
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                // CANCELAR E SALVAR SONHO
            }
            .background(Color("fundoSheet"))
        }
    }
    //
    @MainActor func addDream() {  // função de criar um novo soho
        // pega linhas -> draw
       // let draw = ImageRenderer(content: DrawView(lines: lines)).uiImage?.pngData()
        let newDream = Dream(
            dreamDate: dreamDate,
            title: title,
            desc: desc,
            status: selectedStatus)
        //
        if title.isEmpty || desc.isEmpty {
            showAlert = true
        } else {
            context.insert(newDream) // adiciona o sonho no data context
            dismiss()
        }
    }
}
#Preview {
    AddDreamView(audio: AudioRecorder())
        .modelContainer(for: Dream.self, inMemory: true)
        .scrollDismissesKeyboard(.immediately)
}
//
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
