import XCTest
@testable import Shapesgrid

final class MockAPITests: XCTestCase {
    
    override func setUpWithError() throws { }
    
    func testMockDataAPIData() async throws {
        do {
            let shapesData = try await MockDataService(jsonFileName: "shapesButtonData").fetchDataRequest() as ShapeButtons
            XCTAssertTrue(shapesData.buttons.count > 0 )
            XCTAssertTrue(shapesData.buttons.count == 3 )
        } catch { }
    }
    
    func testMockEmptyDataAPIData() async throws {
        do {
            let shapesData = try await MockDataService(jsonFileName: "emptyData").fetchDataRequest() as ShapeButtons
            XCTAssertTrue(shapesData.buttons.count == 0 )
        } catch { }
    }
    
    func testMockMalformedDataAPIError() async throws {
        do {
            _ = try await MockDataService(jsonFileName: "malformedData").fetchDataRequest() as ShapeButtons
        } catch (let err as AppError) {
            XCTAssertEqual(err, AppError.jsonDataError)
        }
    }
    
    func testMockDataAPIError() async throws {
        do {
            _ = try await MockDataErrorService().fetchDataRequest() as ShapeButtons
        } catch (let err as AppError) {
            XCTAssertEqual(err, AppError.serverError)
        }
    }
}
