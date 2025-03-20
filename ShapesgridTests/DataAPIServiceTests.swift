import XCTest
@testable import Shapesgrid

final class DataAPIServiceTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        // runs once before all the tests begin
    }
   
    func testBaseURL(){
        let urlStr = Environment.baseURL
        XCTAssertTrue(urlStr.isValidURL)
    }
    
    func testShapesDataURL(){
        let urlStr = EndpointsBuilder.shapesJsonEndPoint()
        XCTAssertTrue(urlStr.isValidURL)
    }
    
    func testShapesDataAPI() async throws {
        let apiService = DataAPIService(url:EndpointsBuilder.shapesJsonEndPoint())
        do {
            let shapesData = try await apiService.fetchDataRequest() as ShapeButtons
            XCTAssertTrue(shapesData.buttons.count > 0 )
            XCTAssertTrue(shapesData.buttons.count == 3 )
        } catch(let err as AppError) {
            XCTFail("testShapesButtonDataAPI failed - \(err.localizedDescription))")
        }
    }
}
