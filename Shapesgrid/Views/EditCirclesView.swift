import SwiftUI

struct EditCirclesView: View {
    @StateObject var viewModel : ShapesViewModel
   
    var body: some View {
        ShapesGridView(shapes: viewModel.shapes.filter { $0 is CircleShape })
        Spacer()
        HStack {
            Button(String(localized:"DELETEALL")) {
                viewModel.deleteAllShapes(of:ShapeType.circle)
            }
            Spacer()
     
            Button(String(localized:"ADD")) {
                viewModel.addShape(type:ShapeType.circle.toString())
            }
            Spacer()
            
            Button(String(localized:"REMOVE")) {
                viewModel.removeLastShapeOf(ShapeType.circle)
            }
        }
        .padding()
    }
}
