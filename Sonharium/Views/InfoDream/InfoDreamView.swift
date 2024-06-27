//
//  InfoDreamView.swift
//  Sonharium
//
//  Created by Gilberto Neto on 17/06/24.
//
import SwiftUI
//
class Test: Identifiable, Equatable {
    //
    var image: String
    var background: Color
    var content: String
    var color: Color
    var label: String
    var desc: String
    var tips: String
    var tips2: String
    var fontColor: Color
    var strokeColor: Color
    var fontCardColor: Color
    //
    init(content: String, color: Color, label: String, desc: String, tips: String, tips2: String, background: Color, fontColor: Color, strokeColor: Color, fontCardColor: Color, image: String) {
        self.image = image
        self.content = content
        self.color = color
        self.label = label
        self.desc = desc
        self.tips = tips
        self.tips2 = tips2
        self.background = background
        self.fontColor = fontColor
        self.strokeColor = strokeColor
        self.fontCardColor = fontCardColor
    }
    static func == (_ lhs: Test, _ rhs: Test) -> Bool {
        lhs.content == rhs.content
        && lhs.color == rhs.color
        && lhs.label == rhs.label
        && lhs.desc == rhs.desc
        && lhs.tips == rhs.tips
        && lhs.tips2 == rhs.tips2
        && lhs.background == rhs.background
        && lhs.fontColor == rhs.fontColor
        && lhs.strokeColor == rhs.strokeColor
        && lhs.fontCardColor == rhs.fontCardColor
        && lhs.image == rhs.image
    }
}
//
struct InfoDreamView: View {
    var array: [Test] = [
        Test(
            content: "O que é ter um sonho Lúcido?",
            color: .white,
            label: "Lúcido",
            desc: "Os sonhos lúcidos acontecem \n quando permanecemos conscientes \n enquanto dormimos. Ou seja, você \n sabe que está dormindo durante o sonho. Eles tipicamente ocorrem \n durante o sono REM, um estágio mais pesado de sono.",
            tips: "Reduz a ansiedade",
            tips2: "Traz reflexões",
            background: .fundo,
            fontColor: .accentColor,
            strokeColor: .standard,
            fontCardColor: .card,
            image: "mascoteLucido"
        ),
        Test(
            content: "O que é ter um sonho Vívido?",
            color: .white,
            label: "Vívido",
            desc: "O sonho vivido é uma experiência que\n ocorre durante o sono, na qual a pessoa\n tem a sensação de estar vivenciando uma situação real. Durante esse tipo de sonho, os sentidos e emoções são intensos, fazendo com que a pessoa sinta, veja, ouça e até mesmo cheire coisas que não estão presentes no ambiente físico.",
            tips: "Resolução de problemas",
            tips2: "Melhora da memória",
            background: .fundo,
            fontColor: .accentColor,
            strokeColor: .standard,
            fontCardColor: .card,
            image: "mascoteVivido"
        ),
        Test(
            content: "O que é ter um Pesadelo?",
            color: .white,
            label: "Pesadelo",
            desc: "Os pesadelos podem ser definidos como versões muito intensas de um sonho ruim. Sim, há uma diferença entre os dois. Um pesadelo é um sonho vívido com uma narrativa que pode ser ameaçadora e inquietante. Eles prejudicam o sono de quem passa por eles. Da mesma forma que os sonhos bons, os pesadelos acontecem geralmente durante o sono REM. Eles são intensos o suficiente para acordar uma pessoa. Já os sonhos ruins não têm esse poder.",
            tips: "Perturbação do sono",
            tips2: "Estresse",
            background: .fundo,
            fontColor: .standard,
            strokeColor: .standard,
            fontCardColor: .card,
            image: "mascotePesadelo"
        ),
        Test(
            content: "O que é ter um sonho Habitual?",
            color: .white,
            label: "Habitual",
            desc: "Os sonhos recorrentes são produzidos \ncom frequência durante períodos de estresse, embora haja pessoas que o experimentam durante anos ou até por toda a vida. Em alguns casos, eles desaparecem quando o estado de ânimo da pessoa melhora, mas reaparecem quando ele volta a piorar.",
            tips: "Insights pessoais",
            tips2: "Ansiedade",
            background: .fundo,
            fontColor: .standard,
            strokeColor: .standard,
            fontCardColor: .card,
            image: "mascoteHabitual"
        )
    ]
    @State var selectedModel: Test?
    var body: some View {
        //
        NavigationView {
            //
            ZStack {
                //
                Color(.fundo)
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                //
                VStack(alignment: .center, spacing: 8) {
                    //
                    Text("Informações")
                        .font(.system(size: 25, design: .rounded))
                        .foregroundStyle(Color("AccentColor"))
                        .bold()
                    //
                    HStack(spacing: 8) {
                        ForEach(array) { model in
                            VStack {
                                Button {
                                    selectedModel = model
                                } label: {
                                    HStack(spacing: 8) {
                                        ZStack {
                                            Image(model.image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 70, height: 70)
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 11)
                                                    .stroke(selectedModel == model ? .standard : .clear, lineWidth: 4)
                                                    .stroke(selectedModel == model ? .clear : .lightPurple, lineWidth: 2)
                                            }
                                            .frame(width: 88, height: 88)
                                        }
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                                //
                                Text(model.label)
                                    .foregroundColor(model.strokeColor)
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                            }
                        }
                        .padding(.vertical)
                    }
                    //
                    ScrollView(.vertical) {
                        VStack(spacing: 24) {
                            //
                            Text(selectedModel?.content ?? "Sem tips")
                                .fontWeight(.bold)
                                .frame(width: 342, height: 84)
                                // .border(Color.black)
                                .font(.system(size: 35, design: .rounded))
                                .multilineTextAlignment(.center)
                                .foregroundColor(selectedModel?.fontColor ?? .black)
                           //
                            Text(selectedModel?.desc ?? "Sem tips")
                                .fontWeight(.medium)
                                .frame(maxWidth: 320)
                                // .border(Color.black)
                                .font(.system(size: 17, design: .rounded))
                                .multilineTextAlignment(.center)
                                .foregroundColor(selectedModel?.fontColor ?? .black)
                            //
                            VStack(alignment: .center, spacing: 24) {
                                //
                                ZStack {
                                    Image("fundoInfo")
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(30)
                                        .frame(width: 320, height: 95)
                                    //
                                    Text(selectedModel?.tips ?? "Sem tips")
                                        .fontWeight(.heavy)
                                        .font(.system(size: 25, design: .rounded))
                                        .foregroundColor(selectedModel?.fontCardColor ?? .black)
                                }
                                //
                                ZStack {
                                    Image("fundoInfo")
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(30)
                                        .frame(width: 320, height: 95)
                                    //
                                    Text(selectedModel?.tips2 ?? "Sem tips")
                                        .fontWeight(.heavy)
                                        .font(.system(size: 25, design: .rounded))
                                        .foregroundColor(selectedModel?.fontCardColor ?? .black)
                                }
                            } // TIPS
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .padding(.top, 16)
                .background(selectedModel?.background ?? .white)
                .onAppear {
                    selectedModel = array.first
            }
            }
        }
    }
}
#Preview {
    InfoDreamView()
}
