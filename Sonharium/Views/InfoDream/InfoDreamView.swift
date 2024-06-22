//
//  InfoDreamView.swift
//  Sonharium
//
//  Created by Gilberto Neto on 17/06/24.
//
import SwiftUI
class Test: Identifiable, Equatable {
    var background: Color
    var content: String
    var color: Color
    var label: String
    var desc: String
    var tips: String
    var tips2: String
    var fontColor: Color
    init(content: String, color: Color, label: String, desc: String, tips: String, tips2: String, background: Color, fontColor: Color) {
        self.content = content
        self.color = color
        self.label = label
        self.desc = desc
        self.tips = tips
        self.tips2 = tips2
        self.background = background
        self.fontColor = fontColor
    }
    static func == (_ lhs: Test, _ rhs: Test) -> Bool {
        lhs.content == rhs.content
        && lhs.color == rhs.color
        && lhs.label == rhs.label
        && lhs.desc == rhs.desc
        && lhs.tips == rhs.tips
        && lhs.tips2 == rhs.tips2
        && lhs.background == rhs.background
        && lhs.fontColor == rhs.background
    }
}
struct InfoDreamView: View {
    var array: [Test] = [
        Test(
            content: "O que é ter um sonho lúcido?",
            color: .red,
            label: "Lúcido",
            desc: "Os sonhos lúcidos acontecem \n quando permanecemos conscientes \n enquanto dormimos. Ou seja, você \n sabe que está dormindo durante o sonho. Eles tipicamente ocorrem \n durante o sono REM, um estágio mais pesado de sono.",
            tips: "Reduz a ansiedade",
            tips2: "Traz reflexões",
            background: .lucido,
            fontColor: .black
        ),
        Test(
            content: "O que é ter um sonho vívido?",
            color: .red,
            label: "Vívido",
            desc: "O sonho vivido é uma experiência que\n ocorre durante o sono, na qual a pessoa\n tem a sensação de estar vivenciando uma situação real. Durante esse tipo de sonho, os sentidos e emoções são intensos, fazendo com que a pessoa sinta, veja, ouça e até mesmo cheire coisas que não estão presentes no ambiente físico.",
            tips: "Reduz a ansiedade",
            tips2: "Traz reflexões",
            background: .vivido,
            fontColor: .white
        ),
        Test(
            content: "O que é ter um pesadelo?",
            color: .red,
            label: "Pesadelo",
            desc: "O sonho vivido é uma experiência que\n ocorre durante o sono, na qual a pessoa\n tem a sensação de estar vivenciando uma situação real. Durante esse tipo de sonho, os sentidos e emoções são intensos, fazendo com que a pessoa sinta, veja, ouça e até mesmo cheire coisas que não estão presentes no ambiente físico.",
            tips: "Reduz a ansiedade",
            tips2: "Traz reflexões",
            background: .pesadelo,
            fontColor: .white
        ),
        Test(
            content: "O que é ter um sonho habitual?",
            color: .red,
            label: "Habitual",
            desc: "O sonho vivido é uma experiência que\n ocorre durante o sono, na qual a pessoa\n tem a sensação de estar vivenciando uma situação real. Durante esse tipo de sonho, os sentidos e emoções são intensos, fazendo com que a pessoa sinta, veja, ouça e até mesmo cheire coisas que não estão presentes no ambiente físico.",
            tips: "Reduz a ansiedade",
            tips2: "Traz reflexões",
            background: .red,
            fontColor: .white
        )
    ]
    @State var selectedModel: Test?
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                ScrollView(.horizontal) {
                    VStack {
                        HStack(spacing: 10) {
                            ForEach(array) { model in
                                VStack {
                                    Button {
                                        selectedModel = model
                                    } label: {
                                        //                                            Image(systemImage: "leaf")
                                        //                                                .background {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 11).fill(.white)
                                                    RoundedRectangle(cornerRadius: 11)
                                                        .fill(model.color.opacity(20))
                                                        .stroke(selectedModel == model ? .white : .clear, lineWidth: 5)
                                        }
                                        .frame(width: 100, height: 100)
                                    }
                                   // }
                                    .buttonStyle(PlainButtonStyle())
                                    Text(model.label) // Texto da label abaixo do botão
                                        .foregroundColor(.stroke) // Cor do texto
                                        .font(.system(size: 14, weight: .heavy, design: .rounded))
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .contentMargins(.leading, 10, for: .scrollContent)
                .contentMargins(.trailing, 10, for: .scrollContent)
                ScrollView(.vertical) {
                    VStack {
                        Text(selectedModel?.content ?? "Sem tips")
                            .fontWeight(.heavy)
                            .font(.system(size: 35, design: .rounded))
                            .foregroundColor(.white)
                            Spacer()
                        Text(selectedModel?.desc ?? "Sem tips")
                            .fontWeight(.heavy)
                            .font(.system(size: 18, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.cardLucido)
                                .frame(width: 349, height: 210)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.stroke, lineWidth: 5)
                                )
                            Text(selectedModel?.tips ?? "Sem tips")
                                .fontWeight(.heavy)
                                .padding(.bottom, 90)
                                .font(.system(.title, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .padding()
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.cardLucido)
                                .frame(width: 349, height: 210)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.stroke, lineWidth: 5)
                                )
                            Text(selectedModel?.tips2 ?? "Sem tips")
                                .fontWeight(.heavy)
                                .padding(.bottom, 90)
                                .font(.system(.title, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .background(selectedModel?.background ?? .white)
            .onAppear {
                selectedModel = array.first
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        InfoButtonView(label: "Sonhos", action: {})
                            .padding(5)
                        InfoButtonView(label: "Informações", action: {})
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Image(systemName: "magnifyingglass").font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.stroke)
                        Image(systemName: "gear").font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.stroke)
                    }
                }
            }
        }
    }
}
#Preview {
    InfoDreamView()
}
