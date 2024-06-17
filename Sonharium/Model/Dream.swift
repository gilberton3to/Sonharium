//
//  Dream.swift
//
//  Created by Marcelle Ribeiro Queiroz on 10/06/24.
//
import SwiftData
import SwiftUI

@Model
class Dream {
    var dreamDate = Date()      // data do sonho
    var title: String           // título do sonho
    var desc: String            // descrição do sonho
    var status: Status          // tipo de sonho - Normal Dream, Nightmare, Lucid Dream, Daydream
    init(
        dreamDate: Date = Date.now,
        title: String,
        desc: String,
        status: Status = .normalDream
    ) {
        self.dreamDate = dreamDate
        self.title = title
        self.desc = desc
        self.status = status
    }
    //
    var icon: Image {
        switch status {
        case .normalDream:
            Image(systemName: "cloud")
        case .nightmare:
            Image(systemName: "heart.slash")
        case .lucidDream:
            Image(systemName: "brain.head.profile")
        case .dayDream:
            Image(systemName: "sun.max")
        }
    }
}
//
enum Status: Int, Codable, Identifiable, CaseIterable {
    case normalDream, nightmare, lucidDream, dayDream
    var id: Self {
        self
    }
    var descr: String {
        switch self {
        case .normalDream:
            "Habitual"
        case .nightmare:
            "Pesadelo"
        case .lucidDream:
            "Lúcido"
        case .dayDream:
            "Fantasioso"
        }
    }
}
