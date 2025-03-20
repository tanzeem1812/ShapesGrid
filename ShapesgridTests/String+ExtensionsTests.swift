import XCTest
@testable import Shapesgrid

final class StringTests: XCTestCase {
    
    func testValidURL() {
        let urlStr = "http://dummyurl.com"
        XCTAssertTrue(urlStr.isValidURL)
    }
    
    func testInvalidURL() {
        // few invalid Urls test cases
        
        var urlStr = "1http://google.com"
        XCTAssertTrue(!urlStr.isValidURL)
       
        urlStr = "http:/google.com///"
        XCTAssertTrue(!urlStr.isValidURL)
     
        urlStr = ""
        XCTAssertTrue(!urlStr.isValidURL)
        
        urlStr = "http:google.com"
        XCTAssertTrue(!urlStr.isValidURL )
        
        urlStr = "http:/google.com"
        XCTAssertTrue(!urlStr.isValidURL)
    }
}
