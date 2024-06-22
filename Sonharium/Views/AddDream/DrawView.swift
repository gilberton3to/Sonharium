////
////  CanvasDrawingExample.swift
////  Selection
////
////  Created by Melissa Freire Guedes on 21/06/24.
////
//
// import SwiftUI
// import SwiftData
////
// struct Line {
//    var points: [CGPoint]
//    var color: Color
// }
////
// struct DrawView: View {
//    //
//    let lines: [Line]
//    //
//    var body: some View {
//        Canvas {ctx, size in
//            for line in lines {
//                var path = Path()
//                path.addLines(line.points)
//                //
//                ctx.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
//            }
//        }
//        .frame(width: 300, height: 300)
//        .border(.black)
//    }
// }
////
// struct CanvasDrawingExample: View {
//    //
//    
//    var dream: Dream? = nil
//    
//    @Binding var lines: [Line]
//    @State private var selectedColor = Color.orange
//    var body: some View {
//        VStack {
//            if let draw = dream?.draw, let uiImage = UIImage(data: draw) {
//                Image(uiImage: uiImage)
//                Button("Clear") {
//                    dream?.draw = nil
//                }
//            } else {
//                HStack {
//                    ForEach([Color.green, .orange, .blue, .red, .pink, .black, .purple], id: \.self) { color in
//                        colorButton(color: color)
//                    }
//                    clearButton()
//                }
//                //
//                DrawView(lines: lines)
//                    .gesture(
//                        DragGesture(minimumDistance: 0, coordinateSpace: .local)
//                            .onChanged({ value in
//                                let position = value.location
//                                //
//                                if value.translation == .zero {
//                                    lines.append(Line(points: [position], color: selectedColor))
//                                } else {
//                                    guard let lastIdx = lines.indices.last else {
//                                        return
//                                    }
//                                    //
//                                    lines[lastIdx].points.append(position)
//                                }
//                            })
//                    )
//            }
//        }
//    }
//    //
//    @ViewBuilder
//    func colorButton(color: Color) -> some View {
//        Button {
//            selectedColor = color
//        } label: {
//            Image(systemName: "circle.fill")
//                .font(.largeTitle)
//                .foregroundColor(color)
//                .mask {
//                    Image(systemName: "pencil.tip")
//                        .font(.largeTitle)
//                }
//        }
//    }
//    @ViewBuilder
//    func clearButton() -> some View {
//        Button {
//            lines = []
//        } label: {
//            Image(systemName: "pencil.tip.crop.circle.badge.minus")
//                .font(.largeTitle)
//                .foregroundColor(.gray)
//        }
//    }
// }
// struct CanvasDrawingExample_Previews: PreviewProvider {
//    static var previews: some View {
//        CanvasDrawingExample(lines: .constant([]))
//    }
// }
