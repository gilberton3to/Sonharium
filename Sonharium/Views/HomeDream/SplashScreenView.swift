//
//  SplashScreenView.swift
//  Sonharium
//
//  Created by Gilberto Neto on 19/06/24.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            if authManager.isFaceIDEnabled {
                FaceIdView()
            } else {
                HomeDreamView()
            }
        } else {
            VStack {
                Image(systemName: "sparkles")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
                Text("Sonharium")
                    .foregroundColor(.blue.opacity(0.8))
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 1.0
                    self.opacity = 1.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView().environmentObject(AuthenticationManager())
    }
}
// ZStack {
//    Color.purplelight
//        .ignoresSafeArea()
//    Image("sonharium")
//        .resizable()
//        .frame(width: 200, height: 200)
// }
