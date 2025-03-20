import SwiftUI

struct ShapesGridView: View {
    var shapes: [ShapeView]
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumn ) {
                ForEach(shapes, id: \.id) { shape in
                    shape.view.frame(width: 70, height: 70)
                }
            }
            .padding()
        }
    }
}
