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
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Color("roxo"))
                // .border(Color.pink)
            //
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .center, spacing: 8) {
                    VStack {
                        Text(dream.dreamDate.formatted(.dateTime.day()))
                            .font(.system(size: 35))
                            .foregroundStyle(Color.white)
                            .bold()
                            .padding(.top, 16)
                            // .border(Color.green)
                        Text(dream.dreamDate.formatted(.dateTime.month(.abbreviated)))
                            .font(.system(size: 17))
                            .foregroundStyle(Color.white)
                            // .border(Color.green)
                    }
                    Image("mascote")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 16)
                        // .border(Color.red)
                }
                .frame(width: 89, alignment: .center)
                //
                VStack(alignment: .leading, spacing: 8) {
                    Text(dream.title)
                        .font(.system(size: 22))
                        .foregroundStyle(Color.white)// tipo de fonte
                        .bold()        // estilo da fonte
                        .padding(.top, 16)
                        .padding(.trailing, 16)
                        // .border(Color.yellow)
                    //
                    Text(dream.desc)
                        .lineLimit(3) // número máx de linhas da descrição
                        .font(.system(size: 17))
                        .foregroundStyle(Color.white)
                        .padding(.bottom, 16)
                        .padding(.trailing, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        // .border(Color.orange)
                }
                .padding(8)
            }
        }
        .frame(height: 145)
    }
}
 #Preview {
     Group {
         // swiftlint:disable force_try
         let container = try! ModelContainer(for: Dream.self, configurations: .init(isStoredInMemoryOnly: true))
         MyDreamCardView(
            dream: Dream.init(dreamDate: .now,
                            title: "titulo titulo titulo",
                            desc: "descriçao descriçao descriçao descriçao descriçao descriçao descriçao")
                        ).modelContainer(container)
     }
 }
