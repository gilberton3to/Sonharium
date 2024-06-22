//
//  InfosView.swift
//  Sonharium
//
//  Created by Melissa Freire Guedes on 20/06/24.
//
//
//import SwiftUI
//
//struct Info: Identifiable, Equatable {
//    let id = UUID()
//    var image: String
//    var content: String
//    var color: Color
//    var background: Color
//    var label: String
//    var desc: String
//    var tips: String
//    var tips2: String
//    var fontColor: Color
//    var strokeColor: Color
//    var cardColor: Color
//    var fontCardColor: Color
//
//    init(image: String, content: String, color: Color, label: String, desc: String, tips: String, tips2: String, background: Color, fontColor: Color, strokeColor: Color, cardColor: Color, fontCardColor: Color) {
//        self.image = image
//        self.content = content
//        self.color = color
//        self.label = label
//        self.desc = desc
//        self.tips = tips
//        self.tips2 = tips2
//        self.background = background
//        self.fontColor = fontColor
//        self.strokeColor = strokeColor
//        self.cardColor = cardColor
//        self.fontCardColor = fontCardColor
//    }
//
//    static func == (_ lhs: Info, _ rhs: Info) -> Bool {
//        lhs.image == rhs.image
//        && lhs.content == rhs.content
//        && lhs.color == rhs.color
//        && lhs.label == rhs.label
//        && lhs.desc == rhs.desc
//        && lhs.tips == rhs.tips
//        && lhs.tips2 == rhs.tips2
//        && lhs.background == rhs.background
//        && lhs.fontColor == rhs.fontColor
//        && lhs.strokeColor == rhs.strokeColor
//        && lhs.cardColor == rhs.cardColor
//        && lhs.fontCardColor == rhs.fontCardColor
//    }
//}
//
//struct InfosView: View {
//
//    var array: [Info] = [
//        Info(
//            image: "mascote",
//            content: "Texto da imagem de uma folha",
//            color: .red,
//            label: "Lúcido",
//            desc: "Os sonhos lúcidos acontecem \n quando permanecemos conscientes \n enquanto dormimos. Ou seja, você \n sabe que está dormindo durante o sonho. Eles tipicamente ocorrem \n durante o sono REM, um estágio mais pesado de sono.",
//            tips: "Reduz a ansiedade",
//            tips2: "Traz reflexões",
//            background: .lucido,
//            fontColor: .black,
//            strokeColor: .buttonDarkPurple,
//            cardColor: .lightPurple,
//            fontCardColor: .white
//        ),
//        Info(
//            image: "mascote",
//            content: "Texto da imagem de uma andorinha",
//            color: .red,
//            label: "Lúcido",
//            desc: "Os sonhos lúcidos acontecem \n quando permanecemos conscientes \n enquanto dormimos. Ou seja, você \n sabe que está dormindo durante o sonho. Eles tipicamente ocorrem \n durante o sono REM, um estágio mais pesado de sono.",
//            tips: "Reduz a ansiedade",
//            tips2: "Traz reflexões",
//            background: .lucido,
//            fontColor: .black,
//            strokeColor: .buttonDarkPurple,
//            cardColor: .lightPurple,
//            fontCardColor: .white
//        ),
//        Info(
//            image: "mascote",
//            content: "Texto da imagem de um terminal",
//            color: .red,
//            label: "Lúcido",
//            desc: "Os sonhos lúcidos acontecem \n quando permanecemos conscientes \n enquanto dormimos. Ou seja, você \n sabe que está dormindo durante o sonho. Eles tipicamente ocorrem \n durante o sono REM, um estágio mais pesado de sono.",
//            tips: "Reduz a ansiedade",
//            tips2: "Traz reflexões",
//            background: .lucido,
//            fontColor: .black,
//            strokeColor: .buttonDarkPurple,
//            cardColor: .lightPurple,
//            fontCardColor: .white
//        ),
//        Info(
//            image: "mascote",
//            content: "Texto da imagem de um claquete",
//            color: .red,
//            label: "Lúcido",
//            desc: "Os sonhos lúcidos acontecem \n quando permanecemos conscientes \n enquanto dormimos. Ou seja, você \n sabe que está dormindo durante o sonho. Eles tipicamente ocorrem \n durante o sono REM, um estágio mais pesado de sono.",
//            tips: "Reduz a ansiedade",
//            tips2: "Traz reflexões",
//            background: .lucido,
//            fontColor: .black,
//            strokeColor: .buttonDarkPurple,
//            cardColor: .lightPurple,
//            fontCardColor: .white
//        )
//
//    ]
//
//    @State var selectedModel: Info?
//
//    var body: some View {
//        VStack {
//
//            ScrollView(.horizontal) {
//                HStack {
//                    ForEach(array) { model in
//                        Image(model.image)
//                            .resizable()
//                            .scaledToFit()
//                        .frame(width: 80, height: 80)
//                        .overlay {
//                            Rectangle()
////                                    .fill(model.color.opacity(0.5))
//                                .stroke(selectedModel == model ? Color.blue : Color.clear, lineWidth: 4)
//                        }
//                        .padding(.vertical)
//                        .onTapGesture {
//                            selectedModel = model
//                        }
//                    }
//                }
//            }
//            .scrollIndicators(.hidden)
//            .contentMargins(.leading, 10, for: .scrollContent)
//            .contentMargins(.trailing, 10, for: .scrollContent)
//
//            Text(selectedModel?.content ?? "Sem conteúdo selecionado")
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
//        .background(selectedModel?.color ?? .white)
//        .onAppear {
//            selectedModel = array.first
//        }
//    }
//}
//
//#Preview {
//    InfosView()
//}
