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
            // fundo roxo
            Image("fundo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            //
            VStack(spacing: 24) {
                Image("mascoteTriste")
                //
                Text("Ainda não há sonho")
                    .font(.system(size: 24, design: .rounded))
                    .bold()
            }
        }
    }
}

#Preview {
    NoDrems()
}
