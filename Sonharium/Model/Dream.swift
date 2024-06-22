//
//  Dream.swift
//
//  Created by Marcelle Ribeiro Queiroz on 10/06/24.
//
import Foundation
import SwiftData

@Model
class Dream {
    var dreamDate = Date()    // data do sonho
    var slept = Date()        // hora que dormiu
    var wokeUp = Date()       // hora que acordou
    var title: String         // título do sonho
    var desc: String          // descrição do sonho
    var status: Status        // tipo de sonho - Normal Dream, Nightmare, Lucid Dream, Daydream
    // var draw: Data?
    init(
        dreamDate: Date = Date.now,
        slept: Date = Date.now,
        wokeUp: Date = Date.now,
        title: String,
        desc: String,
        status: Status = .normalDream
        // draw: Data? = nil
    ) {
        self.dreamDate = dreamDate
        self.slept = slept
        self.wokeUp = wokeUp
        self.title = title
        self.desc = desc
        self.status = status
       // self.draw = draw
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
        case .lucidDream:
            "Lúcido"
        case .dayDream:
            "Vívido"
        case .nightmare:
            "Pesadelo"
        }
    }
    var iconName: String { // COLOCAR AS IMAGENS DO MASCOTE PARA CADA TIPO DE SONHO
        switch self {
        case .normalDream:          // HABITUAL
            "cloud"
        case .lucidDream:           // LÚCIDO
            "brain.head.profile"
        case .dayDream:             // VÍVIDO
            "sun.max"
        case .nightmare:            // PESADELO
            "heart.slash"
        }
    }
}
//
// Codigo abaixo ta no status agora
//    var icon: Image {
//        switch status {
//        case .normalDream:
//            Image(systemName: "cloud")
//        case .nightmare:
//            Image(systemName: "heart.slash")
//        case .lucidDream:
//            Image(systemName: "brain.head.profile")
//        case .dayDream:
//            Image(systemName: "sun.max")
//        }
//    }
