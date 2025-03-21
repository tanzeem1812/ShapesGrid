import SwiftUI

struct MainView: View {
    @StateObject  var viewModel : ShapesViewModel
    var body: some View {
        NavigationView {
            VStack {               
                if viewModel.state == .loaded {
                    // Static Buttons
                    if !viewModel.shapeButtons.isEmpty {
                        HStack {
                            Button(action: viewModel.deleteAllShapes) {
                                Text(String(localized:"CLEARALL"))
                            }
                            Spacer()
                            NavigationLink(destination: EditCirclesView(viewModel:viewModel)) {
                                Text(String(localized:"EDITCIRCLES"))
                            }
                        }
                        .padding()
                        
                        // Shapes Grid View
                        Spacer()
                        ShapesGridView(shapes: viewModel.shapes)
                        Spacer()
                        
                        // Dynamic buttons
                        HStack(alignment: .center) {
                            Spacer()
                            ForEach(viewModel.shapeButtons, id:\.self) { button in
                                Button(action: {
                                    viewModel.addShape(type: button.draw_path)
                                }) {
                                    Text(button.name)
                                }
                                Spacer()
                            }
                        }
                    } else {
                        Text(String(localized:"EMPTYDATA"))
                    }
                } else if viewModel.state == .loading {
                    ProgressView(String(localized:"LOADING"))
                } else if viewModel.state == .error(.invalidData) {
                    Text(String(localized:"INVALIDDATA"))
                }
            }.task {
                Task {
                    try await viewModel.fetchShapesData()
                }
            }
        }
    }
}
