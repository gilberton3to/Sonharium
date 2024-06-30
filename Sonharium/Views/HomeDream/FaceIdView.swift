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
                LinearGradient(stops: [
                    .init(color: .fundo, location: 0.90),
                    .init(color: .fundoGradiente, location: 1.02)
                ], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
                //
                VStack(alignment: .center) {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 25, height: 36)
                        .foregroundStyle(Color.standard)
                    //
                    Text(authManager.statusMessage)
                        .bold()
                        .foregroundStyle(Color.standard)
                        .padding()
                    //
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("TextFieldColor"))
                            .frame(width: 120, height: 30)
                        //
                        Button("Desbloquear") {
                            if authManager.isFaceIDEnabled {
                                authManager.authenticate()
                            } else {
                                authManager.statusMessage = "A Biometria está desabilitada!"
                            }
                        }
                    }
                }
                .navigationDestination(isPresented: $authManager.isUnlocked) {
                    HomeDreamView()
                }
            }
        }
    }
}
//
#Preview {
    FaceIdView()
        .environmentObject(AuthenticationManager())
}
