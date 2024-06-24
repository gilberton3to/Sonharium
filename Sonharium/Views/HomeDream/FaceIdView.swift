//
//  Greetings.swift
//  Sonharium
//
//  Created by Gilberto Neto on 18/06/24.
//

import SwiftUI

struct FaceIdView: View {
    @EnvironmentObject var authManager: AuthenticationManager

    var body: some View {
        NavigationStack {
            ZStack {
                Color.fundo
                    .ignoresSafeArea()
                VStack {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 25, height: 36)
                        .foregroundStyle(Color.standard)
                    Text(authManager.statusMessage)
                        .bold()
                        .foregroundStyle(Color.standard)
                        .padding()
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 120, height: 30)
                            .foregroundColor(.white)
                        Button("Desbloquear") {
                            if authManager.isFaceIDEnabled {
                                authManager.authenticate()
                            } else {
                                authManager.statusMessage = "O Face ID está desabilitado!"
                            }
                        }
                    }
                }
                .navigationDestination(isPresented: $authManager.isUnlocked) {
                    HomeDreamView()
                }
            }
        }
        .scrollDisabled(true)
    }
}
//
#Preview {
    FaceIdView().environmentObject(AuthenticationManager())
}
