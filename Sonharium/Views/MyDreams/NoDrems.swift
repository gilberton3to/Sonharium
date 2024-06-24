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
            Image("fundo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            //
            VStack(spacing: 24) {
                Image("mascote")
                //
                Text("Ainda não há sonhos!")
                    .font(.system(size: 25, design: .rounded))
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
