//
//  Sonharium.swift
//
//  Created by Marcelle Ribeiro Queiroz on 10/06/24.
//
//
import SwiftUI
import SwiftData

@main
struct Sonharium: App {
    @StateObject private var authManager = AuthenticationManager()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
//            CalendarioView()
            SplashScreenView()
                .environmentObject(authManager)
                .preferredColorScheme(.light)
        }
        .modelContainer(for: Dream.self)
    }
}
