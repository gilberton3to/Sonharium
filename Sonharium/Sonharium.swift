//
//  Sonharium.swift
//
//  Created by Marcelle Ribeiro Queiroz on 10/06/24.
//

import SwiftUI
import SwiftData

@main
struct Sonharium: App {
    var body: some Scene {
        WindowGroup {
            HomeDreamView()
        }
        .modelContainer(for: Dream.self)
    }
}
