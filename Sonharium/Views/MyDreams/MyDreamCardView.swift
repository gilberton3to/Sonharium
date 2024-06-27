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
                .fill(Color("card"))
                .stroke(Color.standard, lineWidth: 2)
                // .border(Color.pink)
            //
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .center, spacing: 8) {
                    VStack {
                        //
                        Text(dream.dreamDate.formatted(.dateTime.day()))
                            .font(.system(size: 35, design: .rounded))
                            .foregroundStyle(Color.standard)
                            .fontWeight(.heavy)
                            .padding(.top, 7)
                            // .border(Color.green)
                        //
                        Text(dream.dreamDate.formatted(.dateTime.month(.abbreviated)))
                            .font(.system(size: 17, design: .rounded))
                            .foregroundStyle(Color.standard)
                            .fontWeight(.bold)
                            // .border(Color.green)
                    }  // DATA E MÊS
                    Image(dream.status.iconName)
                        .resizable()
                        .frame(width: 41, height: 36)
                        // .border(Color.red)
                } // DATA + MÊS + MASCOTE
                .frame(width: 69, alignment: .center)
                //
                VStack(alignment: .leading, spacing: 8) {
                    //
                    Text(dream.title)
                        .font(.system(size: 22, weight: .heavy, design: .rounded))
                        .foregroundStyle(Color.standard)
                        .padding(.trailing, 16)
                        .frame(maxWidth: 280, alignment: .topLeading)
                        // .border(Color.yellow)
                    //
                    Text(dream.desc)
                        .lineLimit(3) // número máx de linhas da descrição
                        .font(.system(size: 17, design: .rounded))
                        .foregroundStyle(Color.standard)
                        .padding(.bottom, 16)
                        .padding(.trailing, 16)
                        .frame(maxWidth: 280, alignment: .topLeading)
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
