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
    //
    @State private var dreamDate = Date()
    @State private var slept = Date()
    @State private var wokeUp = Date()
    @State private var title = ""
    @State private var desc = ""
    @State private var selectedStatus = Status.normalDream
    // @State private var lines: [Line] = []
    //
    var closedRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    //
    var body: some View {
        NavigationStack {
            //
            ZStack {
                // FUNDO
                Image("fundo")
                    .resizable()
                //
                VStack(alignment: .center, spacing: 16) {
                    HStack(spacing: 8) {
                        //
                        VStack(alignment: .center) {
                            Text("Sonhei no dia:  ")
                                .font(.system(size: 17, design: .rounded))
                                .bold()
                                .foregroundStyle(Color("AccentColor"))
                            DatePicker("",
                                       selection: $dreamDate,
                                       displayedComponents: DatePickerComponents.date)
                            .padding(.trailing, 16)
                            .colorScheme(.light)
                        } // sonhei no dia
                        .frame(width: 140)
                        // .border(Color.green)
                        VStack(alignment: .center) {
                            Text("Dormi às:")
                                .font(.system(size: 17, design: .rounded))
                                .bold()
                                .foregroundStyle(Color("AccentColor"))
                            DatePicker("",
                                       selection: $slept,
                                       displayedComponents: DatePickerComponents.hourAndMinute)
                            .padding(.trailing, 16)
                            .colorScheme(.light)
                        } // dormi às
                        .frame(width: 100)
                        // .border(Color.green)
                        VStack(alignment: .center) {
                            Text("Acordei às:")
                                .font(.system(size: 17, design: .rounded))
                                .bold()
                                .foregroundStyle(Color("AccentColor"))
                            DatePicker("",
                                       selection: $wokeUp,
                                       displayedComponents: DatePickerComponents.hourAndMinute)
                            .padding(.trailing, 16)
                            .colorScheme(.light)
                        } // acordei às
                        .frame(width: 100)
                        // .border(Color.green)
                    } // DATA E HORAS
                    //
                    Text("Escolha um título para o seu sonho:")
                        .font(.system(size: 17, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color("AccentColor"))
                        .padding(.trailing, 63)
                        .padding(.bottom, -7)
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color("card"))
                            .frame(width: 360, height: 45)
                        //
                        TextField("Título",
                                  text: $title,
                                  axis: .vertical)
                            .font(.system(size: 17, design: .rounded))
                            .foregroundStyle(.secondary)
                            .padding(8)
                            .frame(width: 350, height: 40, alignment: .leading)
                    } // TÍTULO
                    //
                    Text("O que aconteceu? Descreva como foi...")
                        .font(.system(size: 17, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color("AccentColor"))
                        .padding(.trailing, 36)
                        .padding(.bottom, -7)
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color("card"))
                            .frame(width: 360, height: 205)
                        //
                        TextField("Descrição",
                                  text: $desc,
                                  axis: .vertical)
                            .font(.system(size: 17, design: .rounded))
                            .foregroundStyle(.secondary)
                            .padding(8)
                            .frame(width: 350, height: 200, alignment: .topLeading)
                    } // DESCRIÇÃO
                    //
                    Text("Qual tipo de sonho você teve hoje?")
                        .font(.system(size: 17, design: .rounded))
                        .foregroundStyle(Color("AccentColor"))
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
                                                    .fill(status == selectedStatus ? Color("AccentColor") : Color("card"))
                                            }
                                            .foregroundStyle(status == selectedStatus ? Color("card") : Color("AccentColor"))
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
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(.accent, lineWidth: 2)
                                        .fill(Color("card"))
                                }
                                .foregroundStyle(Color("AccentColor"))
                        } // STATUS SONHO
//                        HStack(spacing: 8) {
//                            Button("Desenhar") {
//                                // colocar ação DESENHAR
//                            }
//                            .buttonStyle(.borderedProminent)
//                            //
//                            Button(action: {
//                                if audio.recording {
//                                    audio.stopRecording()
//                                } else {
//                                    audio.startRecording()
//                                }
//                            }, label: {
//                                Text("Gravar Áudio")
//                            })
//                            .buttonStyle(.borderedProminent)
//                            Text(audio.recording ? "Recording..." : "Click to record")
//                                .font(.caption)
//                                .bold()
//                                .foregroundStyle(audio.recording ? .green : .blue)
//                        } // DESENHAR + GRAVAR - BOTÕES
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Novo sonho")
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
                }  // CANCELAR E SALVAR SONHO
            }
            .background(Color("fundo"))
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
        .scrollDismissesKeyboard(.automatic)
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
