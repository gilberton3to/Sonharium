//
//  SplashScreenView.swift
//  Sonharium
//
//  Created by Gilberto Neto on 19/06/24.
//

import SwiftUI

struct SplashScreenView: View {
    //
    @EnvironmentObject var authManager: AuthenticationManager
    //
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    //
    var body: some View {
        //
        if isActive {
            if authManager.isFaceIDEnabled {
                FaceIdView()
            } else {
                HomeDreamView()
            }
        } else {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.fundoGradiente, Color.fundoGradienteDois]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .opacity(1.0)
                .scaledToFill()
                .ignoresSafeArea(.all)
                //
                VStack {
                    Image(systemName: "zzz")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 30))
                        .bold()
                        .rotationEffect(.radians(-12))
                        .padding(.leading, 140)
                        .padding(.bottom, -23)
                        .symbolEffect(.pulse, options: .repeat(5).speed(5.0))
                    Image("mascote")
                        .font(.system(size: 60))
//                        .foregroundColor(.blue)
                    Text("Sonharium")
                        .foregroundColor(.white)
                        .font(Font.custom("Lilita One", size: 28))
                        .fontWeight(.bold)
                        .padding(.vertical, 15)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
#Preview {
    SplashScreenView()
        .environmentObject(AuthenticationManager())
}
// ZStack {
//    Color.purplelight
//        .ignoresSafeArea()
//    Image("sonharium")
//        .resizable()
//        .frame(width: 200, height: 200)
// }
