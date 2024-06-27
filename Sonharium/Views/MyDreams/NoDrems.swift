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
                .init(color: .accentColor, location: 1.03)
            ], startPoint: .bottom, endPoint: .top)
            .ignoresSafeArea()
            //
            VStack(spacing: 24) {
                Image("mascote")
                //
                Text("Ainda não há sonhos!")
                    .font(.system(size: 30, design: .rounded))
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
