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
    let dream: Dream?
    //
    var body: some View {
        ZStack {
            // FUNDO DO CARD
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color("card"))
                .stroke(.accent, lineWidth: 2)
                .frame(width: 316, height: 441)
            //
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(Color("card"))
                        .stroke(.accent, lineWidth: 2)
                        .frame(width: 255, height: 160)
                    //
                    Image("mascote")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                    //
                    VStack(alignment: .center, spacing: -5) {
                        // dia
                        Text((dream?.dreamDate.formatted(.dateTime.day())) ?? "")
                            .font(.system(size: 32, design: .rounded))
                            .foregroundStyle(Color.accentColor)
                            .fontWeight(.heavy)
                        // mês
                        Text((dream?.dreamDate.formatted(.dateTime.month())) ?? "")
                            .font(.system(size: 17, design: .rounded))
                            .foregroundStyle(Color.accentColor)
                            .fontWeight(.heavy)
                    }
                    .offset(x: -90, y: -40)
                } // DATA + MASCOTE
                //
                Text(dream?.title ?? "Ops!")
                    .font(.system(size: 25, design: .rounded))
                    .foregroundStyle(Color.accentColor)
                    .bold()
                    .frame(width: 255, alignment: .leading)
                    .padding(.leading)
                //
                Text(dream?.desc ?? "Não há sonhos cadastrados nesse dia")
                    .lineLimit(6) // número máx de linhas da descrição
                    .font(.system(size: 17, design: .rounded))
                    .fontWeight(.regular)
                    .foregroundStyle(Color.accentColor)
                    .frame(width: 255, height: 125, alignment: .topLeading)
                    .padding(.leading)
            }
        }
        .opacity(dream == nil ? 0.25 : 1)
    }
}
 #Preview {
     Group {
         let container = try! ModelContainer(for: Dream.self, configurations: .init(isStoredInMemoryOnly: true))
         DreamCardView(
            dream: Dream.init(dreamDate: .now,
                            title: "titulo titulo titulo",
                            desc: "descriçao descriçao descriçao descriçao descriçao descriçao descriçao descriçaodescriçao descriçao descriçao descriçao descriçao descriçao descriçao descriçao")
                        ).modelContainer(container)
     }
 }
