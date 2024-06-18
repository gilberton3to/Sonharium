//  SelectionView.swift
//  SwiftUI-iOS
//
//  Created by Gabriela Bezerra on 18/06/24.
//  Copyright © 2024 Gabriela Bezerra. All rights reserved.
//

import SwiftUI

class Teste: Identifiable, Equatable {
    var image: String       // imagem do mascote
    var content: String
    var color: Color        // cor do tipo de sonho

    init(image: String, content: String, color: Color) {
        self.image = image
        self.content = content
        self.color = color
    }

    static func == (_ lhs: Teste, _ rhs: Teste) -> Bool {
        lhs.image == rhs.image
        && lhs.content == rhs.content
        && lhs.color == rhs.color
    }
}

struct SelectionView: View {

    var array: [Teste] = [
        Teste(
            image: "leaf",
            content: "Texto da imagem de uma folha",
            color: .red
        ),
        Teste(
            image: "swift",
            content: "Texto da imagem de uma andorinha",
            color: .orange
        ),
        Teste(
            image: "apple.terminal",
            content: "Texto da imagem de um terminal",
            color: .green
        ),
        Teste(
            image: "movieclapper",
            content: "Texto da imagem de um claquete",
            color: .purple
        ),
        Teste(
            image: "hands.and.sparkles",
            content: "Texto da imagem de mãos batendo palmas",
            color: .blue
        )
    ]

    @State var selectedTeste: Teste?

    var body: some View {
        VStack {

            ScrollView(.horizontal) {
                HStack {
                    ForEach(array) { teste in
                        Image(systemName: teste.image)
                            .font(.largeTitle)
                        .frame(width: 80, height: 80)
                        .background {
                            ZStack {
                                RoundedRectangle(cornerRadius: 11).fill(.white)
                                RoundedRectangle(cornerRadius: 11)
                                    .fill(teste.color.opacity(0.5))
                                    .stroke(selectedTeste == teste ? .white : .clear, lineWidth: 4, antialiased: true)
                            }
                        }
                        .padding(.vertical)
                        .onTapGesture {
                            selectedTeste = teste
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .contentMargins(.leading, 10, for: .scrollContent)
            .contentMargins(.trailing, 10, for: .scrollContent)

            Text(selectedTeste?.content ?? "Sem conteúdo selecionado")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(selectedTeste?.color ?? .white)
        .onAppear {
            selectedTeste = array.first
        }
    }
}

#Preview {
    SelectionView()
}
