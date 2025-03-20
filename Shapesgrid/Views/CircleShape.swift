import SwiftUI

struct CircleShape: ShapeView {
    let id = UUID()
    var color: Color = Color.cyan
    var view: AnyView {
        AnyView(Circle().fill(color))
    }
}

