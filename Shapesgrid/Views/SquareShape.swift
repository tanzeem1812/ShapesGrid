import SwiftUI

struct SquareShape: ShapeView {
    let id = UUID()
    var color: Color = Color.cyan
    var view: AnyView {
        AnyView(Rectangle().fill(color))
    }
}
