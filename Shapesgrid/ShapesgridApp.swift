import SwiftUI

@main
struct ShapesgridApp: App {
    var body: some Scene {
        WindowGroup {
            let apiService = DataAPIService(url: EndpointsBuilder.shapesJsonEndPoint())
            let viewModel = ShapesViewModel(apiService: apiService)
            MainView(viewModel: viewModel)
        }
    }
}

