//
//  ButtonDreamView.swift
//  Sonharium
//
//  Created by Marcelle Ribeiro Queiroz on 18/06/24.
//

import SwiftUI

class DreamType: Identifiable, Equatable {
    var image: String
    var color: Color

    init(image: String, content: String, color: Color) {
        self.image = image
        self.content = content
        self.color = color
    }

    static func == (_ lhs: Teste, _ rhs: Teste) -> Bool {
        lhs.image == rhs.image
        && lhs.content == rhs.content
        && lhs.color == rhs.color
    }
}

struct ButtonDreamView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ButtonDreamView()
}
