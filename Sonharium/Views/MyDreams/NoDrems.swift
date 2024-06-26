//
//  emptyDremsView.swift
//  Sonharium
//
//  Created by Marcelle Ribeiro Queiroz on 19/06/24.
//

import SwiftUI

struct NoDrems: View {
    var body: some View {
        ZStack {
            // fundo
            LinearGradient(stops: [
                .init(color: .fundo, location: 0.90),
                .init(color: .fundoGradiente, location: 1.02)
            ], startPoint: .bottom, endPoint: .top)
            .ignoresSafeArea()
            //
            VStack(spacing: 29) {
                Image("mascote")
                //
                Text("Ainda não há sonhos!")
                    .font(.system(size: 23, design: .rounded))
                    .foregroundStyle(Color("AccentColor"))
                    .bold()
            }
        }
        .background(Color("fundo"))
    }
}

#Preview {
    NoDrems()
}
