//
//  AuthenticationManager.swift
//  Sonharium
//
//  Created by Gilberto Neto on 19/06/24.
//

import SwiftUI
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    @Published var isFaceIDEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isFaceIDEnabled, forKey: "isFaceIDEnabled")
        }
    }
    @Published var isUnlocked: Bool = false
    @Published var statusMessage: String = "Bloqueado"

    init() {
        self.isFaceIDEnabled = UserDefaults.standard.bool(forKey: "isFaceIDEnabled")
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: "This is for security reasons") { success, _ in
                DispatchQueue.main.async {
                    if success {
                        self.statusMessage = "Desbloqueado"
                        self.isUnlocked = true
                    } else {
                        self.statusMessage = "Há um problema!"
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.statusMessage = "O iPhone não tem sistema de biometria!"
            }
        }
    }
}
