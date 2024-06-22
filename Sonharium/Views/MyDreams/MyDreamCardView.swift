//
//  MyDreamCardView.swift
//
//  Created by Marcelle Ribeiro Queiroz on 15/06/24.
//

import SwiftUI
import SwiftData

struct MyDreamCardView: View {
    //
    let dream: Dream
    //
    var body: some View {
        ZStack {
            // fundo roxo
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color("roxo"))
                // .border(Color.pink)
            //
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .center, spacing: 8) {
                    VStack {
                        Text(dream.dreamDate.formatted(.dateTime.day()))
                            .font(.system(size: 35, design: .rounded))
                            .foregroundStyle(Color.white)
                            .bold()
                            .padding(.top, 16)
                            // .border(Color.green)
                        Text(dream.dreamDate.formatted(.dateTime.month(.abbreviated)))
                            .font(.system(size: 17, design: .rounded))
                            .foregroundStyle(Color.white)
                            .bold()
                            // .border(Color.green)
                    }  // DATA E MÊS
                    Image("mascote")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 16)
                        // .border(Color.red)
                } // DATA + MÊS + MASCOTE
                .frame(width: 89, alignment: .center)
                //
                VStack(alignment: .leading, spacing: 8) {
                    Text(dream.title)
                        .font(.system(size: 22, design: .rounded))
                        .foregroundStyle(Color.white)
                        .bold()
                        .padding(.top, 16)
                        .padding(.trailing, 16)
                        // .border(Color.yellow)
                    //
                    Text(dream.desc)
                        .lineLimit(3) // número máx de linhas da descrição
                        .font(.system(size: 17, design: .rounded))
                        .foregroundStyle(Color.white)
                        .padding(.bottom, 16)
                        .padding(.trailing, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        // .border(Color.orange)
                } // TÍTULO + DESCRIÇÃO
                .padding(8)
            }
        }
        .frame(height: 145) // fixa só a altura do card!
    }
}
 #Preview {
     Group {
         let container = try! ModelContainer(for: Dream.self, configurations: .init(isStoredInMemoryOnly: true))
         MyDreamCardView(
            dream: Dream.init(dreamDate: .now,
                            title: "titulo titulo titulo",
                              desc: "descriçao descriçao descriçao descriçao descriçao descriçao descriçao")
                        ).modelContainer(container)
     }
 }
