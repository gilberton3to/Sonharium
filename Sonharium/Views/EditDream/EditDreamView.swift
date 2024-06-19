//
//  EditDreamView.swift
//
//  Created by Gilberto Neto on 17/06/24.
//

import SwiftUI

struct EditDreamView: View {
    @Environment(\.dismiss) private var dismiss
    let dream: Dream
    @State private var title = ""
    @State private var desc = ""
    @State private var type = ""
    var body: some View {
        Text("Hello, World!")
    }
}
// #Preview {
//    EditDreamView()
// }
