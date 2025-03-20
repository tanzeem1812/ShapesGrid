import SwiftUI

struct TriangleShape: ShapeView {
    let id = UUID()
    let topPoint:CGPoint
    let bottomLeftPoint:CGPoint
    let bottomRightPoint:CGPoint
    
    /*                 topPoint
                          .
                         / \
                        /   \
                       /     \
     bottomLeftPoint  ._______.  bottomRightPoint
     */
    
    var color: Color = Color.cyan
    var view: AnyView {
        AnyView(Triangle(topPoint: topPoint,
                        bottomLeftPoint: bottomLeftPoint,
                        bottomRightPoint: bottomRightPoint,
                        color:color)
        )
    }
}

struct Triangle: View {
    let topPoint:CGPoint
    let bottomLeftPoint:CGPoint
    let bottomRightPoint:CGPoint
    let color: Color

    var body: some View {
        Path {
            $0.move(to: topPoint)
            $0.addLine(to: bottomLeftPoint)
            $0.addLine(to: bottomRightPoint)
            $0.closeSubpath() // close the path is optional, but its a good practice
        }.fill(color)
    }
}
