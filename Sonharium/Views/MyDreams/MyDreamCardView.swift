//
//  MyDreamCardView.swift
//
//  Created by Marcelle Ribeiro Queiroz on 15/06/24.
//

import SwiftUI

struct MyDreamCardView: View {
    //
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("25")
                    .font(.title)
                    .bold()
                    .frame(width: 58, height: 20)
                Image("mascote")
                    .resizable() // conseguir mudar o tamanho
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .frame(width: 58, height: 65)
            }
            VStack(alignment: .leading) {
                Text("Título do sonho")
                    .font(.system(size: 24)) // tipo de fonte
                    .bold()        // estilo da fonte
                    .frame(width: 230, height: 15, alignment: .leading)
                Text("Descrição do sonho bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla")
                    .lineLimit(2) // número máx de linhas da descrição
                    .font(.system(size: 18))
                    .frame(width: 230, height: 60, alignment: .leading)
            }
        }
        .foregroundStyle(Color.white) // cor do texto (todos do card)
        .padding(8) // espaçamento
        .background {
            RoundedRectangle(cornerRadius: 30, style: .continuous) // deixar redondo
                .fill(Color("purple")) // cor do card
                .frame(width: 348, height: 142.06) // frame do card
        }
        .padding(.horizontal)
        .padding(.vertical, 16)
    }
}

#Preview {
    MyDreamCardView()
        .background(.black) // ver o espaçamento do card
}
