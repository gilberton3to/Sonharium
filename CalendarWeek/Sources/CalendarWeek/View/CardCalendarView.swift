//
//  CardCalendarView.swift
//  SwiftUI-iOS
//
//  Created by Gabriela Bezerra on 21/06/24.
//  Copyright © 2024 Gabriela Bezerra. All rights reserved.
//

import Foundation
import SwiftUI

struct CardCalendarView<Model: CalendarModel, CardContent: View, EmptyCardContent: View>: View {

    @Environment(CalendarViewModel<Model>.self) var viewModel: CalendarViewModel

    let contentMarginsForScrollContent: Double
    @ViewBuilder var cardView: (Model) -> CardContent
    @ViewBuilder var emptyCardView: () -> EmptyCardContent

    var body: some View {
        @Bindable var viewModel = viewModel
        ZStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.selectedWeek.days, id: \.self) { day in
                        Group {
                            if let model = viewModel.model(for: day) {
                                cardView(model)
                            } else {
                                emptyCardView()
                            }
                        }
                    }
                }
                .scrollTargetLayout()
                .opacity(viewModel.models.isEmpty ? 0 : 1)
            }
            .contentMargins(contentMarginsForScrollContent, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .scrollPosition(id: $viewModel.selectedDay)
            .animation(.easeInOut, value: viewModel.selectedDay)
            // TO_DO: Empty state aqui
            if viewModel.models.isEmpty {
                VStack {
                    Image("mascote")
                    //
                    Text("Ainda não há sonhos!")
                        .font(.system(size: 30, design: .rounded))
                        .foregroundStyle(Color("AccentColor"))
                        .bold()
                }
//                Text("Adicione novos sonhos!")
//                    .fontDesign(.rounded)
//                    .fontWeight(.medium)
//                    .foregroundStyle(Color.accentColor)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
