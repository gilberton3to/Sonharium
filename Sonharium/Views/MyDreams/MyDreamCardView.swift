//
//  MyDreamCardView.swift
//
//  Created by Marcelle Ribeiro Queiroz on 15/06/24.
//

import SwiftUI

struct MyDreamCardView: View {
    //
    let dream: Dream
    //
    var body: some View {
        ZStack {
            // fundo roxo
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Color("roxo"))
                .frame(width: 360, height: 140)
            //
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(dream.dreamDate.formatted(.dateTime.day())) // DATA
                        .font(.system(size: 35))
                        .foregroundStyle(Color.white)
                        .bold()
                        .frame(width: 103, height: 140, alignment: .center)
                }
                VStack(alignment: .leading) {
                    Text(dream.title)
                        .font(.system(size: 24))
                        .foregroundStyle(Color.white)// tipo de fonte
                        .bold()        // estilo da fonte
                        .frame(width: 257, height: 59, alignment: .leading)
                    Text(dream.desc)
                        .lineLimit(3) // número máx de linhas da descrição
                        .font(.system(size: 17))
                        .foregroundStyle(Color.white)
                        .frame(width: 210, height: 81, alignment: .topLeading)
                }
            }
        }
    }
}
// #Preview {
//    MyDreamCardView()
//        .background(.black) // ver o espaçamento do card
// }
