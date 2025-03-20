import SwiftUI

class ShapesViewModel: ObservableObject{
    @Published var state: ViewState = .idle
    @Published var shapes: [ShapeView] = []
    var apiService:APIService
    var shapeButtons = [ShapeButton]()

    init(apiService: APIService) {
        self.apiService = apiService
    }

    @MainActor
    func fetchShapesData() async throws {
        do {
            state = .loading
            let shapesData = try await apiService.fetchDataRequest() as ShapeButtons
            self.shapeButtons = shapesData.buttons
            state = .loaded
        } catch (let appError as AppError) {
            state =  .error(appError)
        }
    }
    
    func addShape(type: String) {
        let newShape: ShapeView
        switch type {
        case ShapeType.circle.toString():
            newShape = CircleShape()
        case ShapeType.square.toString():
            newShape = SquareShape()
        case ShapeType.triangle.toString():
            newShape = TriangleShape(topPoint: CGPoint(x: 35, y: 0),
                                     bottomLeftPoint: CGPoint(x: 75, y: 70),
                                     bottomRightPoint: CGPoint(x: 0, y: 70)
                       )
        default:
            return
        }
        shapes.append(newShape)
    }
    
    func deleteAllShapes() {
        shapes.removeAll()
    }
    
    func deleteAllShapes(of shapeType:ShapeType) {
        switch shapeType {
        case .circle :
            shapes.removeAll { $0 is CircleShape}
        case .square :
            shapes.removeAll { $0 is SquareShape}
        case .triangle :
            shapes.removeAll { $0 is TriangleShape}
        }
    }
    
    func removeLastShapeOf(_ shapeType:ShapeType) {
        var index:Int?
        switch shapeType {
        case .circle:
            index = shapes.lastIndex(where: {$0 is CircleShape})
        case .square :
            index = shapes.lastIndex(where: {$0 is SquareShape})
        case .triangle :
            index = shapes.lastIndex(where: {$0 is TriangleShape})
        }
        if let index {
            shapes.remove(at: index)
        }
    }
    
    enum ViewState: Equatable {
        case idle
        case loading
        case loaded
        case error(AppError)
    }
}
