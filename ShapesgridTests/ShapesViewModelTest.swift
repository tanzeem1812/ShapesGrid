import XCTest
@testable import Shapesgrid

final class ViewModelTest: XCTestCase {
  
    override func setUpWithError() throws { }
    
    func testViewModelMockData() async throws {
        let apiService = MockDataService(jsonFileName: "shapesButtonData")
        let viewModel = ShapesViewModel(apiService: apiService)
        try await viewModel.fetchShapesData()
        XCTAssertTrue(viewModel.shapeButtons.count > 0)
    }
    func testViewModelMalformedMockData() async throws {
        let apiService = MockDataService(jsonFileName: "malformedData")
        let viewModel = ShapesViewModel(apiService: apiService)
        try await viewModel.fetchShapesData()
        XCTAssertTrue(viewModel.state == .error(.jsonDataError))
    }
    func testViewModelEmptyMockData() async throws {
        let apiService = MockDataService(jsonFileName: "emptyData")
        let viewModel = ShapesViewModel(apiService: apiService)
        try await viewModel.fetchShapesData()
        XCTAssertTrue(viewModel.shapeButtons.count == 0)
    }
    
    func testViewModelMockDataError()  async throws {
        let viewModel = ShapesViewModel(apiService:MockDataErrorService())
        try await viewModel.fetchShapesData()
        XCTAssertTrue(viewModel.state == .error(.serverError))
      }
    
    func testShapeButtonsDataAPI() async throws {
        let urlStr = EndpointsBuilder.shapesJsonEndPoint()
        let viewModel =  ShapesViewModel(apiService:DataAPIService(url: urlStr))
        try await viewModel.fetchShapesData()
        XCTAssertTrue(viewModel.shapeButtons.count > 0)
    }
        
    func testInvalidURLAPI() async throws {
        let urlStr = "/http://google.com"
        let viewModel =  ShapesViewModel(apiService:DataAPIService(url: urlStr))
        try await viewModel.fetchShapesData()
        XCTAssertTrue(viewModel.state == .error(.invalidUrl))
    }

    // Keep on Adding more respective Viewmodel test cases
}
