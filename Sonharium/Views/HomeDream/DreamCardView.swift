//
//  DreamCardView.swift
//  Sonharium
//
//  Created by Gilberto Neto on 17/06/24.
//

import SwiftUI
import SwiftData

struct DreamCardView: View {
    //
    let dream: Dream
    //
    var body: some View {
        ZStack {
            // FUNDO DO CARD
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color("roxo"))
                .frame(width: 316, height: 441)
                .border(Color.pink)
            //
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(Color("fundoText"))
                        .frame(width: 255, height: 160)
                    //
                    Image("mascote")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 140)
                    //
                    VStack(alignment: .center, spacing: -5) {
                        Text(dream.dreamDate.formatted(.dateTime.day()))
                            .font(.system(size: 32, design: .rounded))
                            .foregroundStyle(Color("roxo"))
                            .bold()
                        Text(dream.dreamDate.formatted(.dateTime.month()))
                            .font(.system(size: 17, design: .rounded))
                            .foregroundStyle(Color("roxo"))
                            .bold()
                    }
                    .offset(x: -90, y: -40)
                } // DATA + MASCOTE
                //
                Text(dream.title)
                    .font(.system(size: 25, design: .rounded))
                    .foregroundStyle(Color.white)
                    .bold()
                    .frame(width: 255, alignment: .leading)
                    .padding(.leading)
                //
                Text(dream.desc)
                    .lineLimit(6) // número máx de linhas da descrição
                    .font(.system(size: 17, design: .rounded))
                    .foregroundStyle(Color.white)
                    .frame(width: 255, height: 125, alignment: .topLeading)
                    .padding(.leading)
            }
        }
    }
}
 #Preview {
     Group {
         // swiftlint:disable force_try
         let container = try! ModelContainer(for: Dream.self, configurations: .init(isStoredInMemoryOnly: true))
         DreamCardView(
            dream: Dream.init(dreamDate: .now,
                            title: "titulo titulo titulo",
                            desc: "descriçao descriçao descriçao descriçao descriçao descriçao descriçao descriçaodescriçao descriçao descriçao descriçao descriçao descriçao descriçao descriçao")
                        ).modelContainer(container)
     }
 }
