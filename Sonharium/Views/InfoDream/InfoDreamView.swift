//
//  InfoDreamView.swift
//  Sonharium
//
//  Created by Gilberto Neto on 17/06/24.
//
import SwiftUI
//
class Test: Identifiable, Equatable {
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
    var cardColor: Color
    var fontCardColor: Color
    var imageCard: String
    init(content: String, color: Color, label: String, desc: String, tips: String, tips2: String, background: Color, fontColor: Color, strokeColor: Color, cardColor: Color, fontCardColor: Color, image: String, imageCard: String) {
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
        self.cardColor = cardColor
        self.fontCardColor = fontCardColor
        self.imageCard = imageCard
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
        && lhs.cardColor == rhs.cardColor
        && lhs.fontCardColor == rhs.fontCardColor
        && lhs.image == rhs.image
        && lhs.imageCard == lhs.imageCard
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
            cardColor: .white,
            fontCardColor: .accent,
            image: "mascoteLucido",
            imageCard: "mascoteSemFundo"
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
            cardColor: .white,
            fontCardColor: .accentColor,
            image: "mascoteVivido",
            imageCard: "mascoteSemFundo"
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
            cardColor: .white,
            fontCardColor: .accentColor,
            image: "mascotePesadelo",
            imageCard: "mascoteSemFundo"
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
            cardColor: .white,
            fontCardColor: .accentColor,
            image: "mascoteHabitual",
            imageCard: "mascoteSemFundo"
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
                VStack(alignment: .center) {
                    //
                    HStack(spacing: 4) {
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
                                                    .stroke(selectedModel == model ? .standard : .clear, lineWidth: 5)
                                                    .stroke(selectedModel == model ? .clear : .standard, lineWidth: 1)
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
                            VStack(spacing: 16) {
                                ZStack {
                                    //
                                    RoundedRectangle(cornerRadius: 24)
                                        .fill(selectedModel?.cardColor ?? .black)
                                        .frame(width: 320, height: 150)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 24)
                                                .stroke(selectedModel?.strokeColor ?? .black, lineWidth: 5)
                                        )
                                    //
                                    VStack {
                                        Text(selectedModel?.tips ?? "Sem tips")
                                            .fontWeight(.bold)
                                            .padding(.top, 8)
                                            .font(.system(size: 22, design: .rounded))
                                            .foregroundColor(selectedModel?.fontCardColor ?? .black)
                                        //
                                        Image(selectedModel?.imageCard ?? "")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                    }
                                }
                                //
                                ZStack {
                                    //
                                    RoundedRectangle(cornerRadius: 24)
                                        .fill(selectedModel?.cardColor ?? .black)
                                        .frame(width: 320, height: 150)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 24)
                                                .stroke(selectedModel?.strokeColor ?? .black, lineWidth: 5)
                                        )
                                    //
                                    VStack {
                                        Text(selectedModel?.tips2 ?? "Sem tips")
                                            .fontWeight(.bold)
                                            .padding(.top, 8)
                                            .font(.system(size: 22, design: .rounded))
                                            .foregroundColor(selectedModel?.fontCardColor ?? .black)
                                        //
                                        Image(selectedModel?.imageCard ?? "")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                    }
                                }
                            }
                        }
                    }
                }
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
