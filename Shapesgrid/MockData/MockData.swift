import Foundation

struct MockData<T:Decodable>{
    static func mockDataForJsonFile(fileName:String) throws -> T {
        if let mockDataURL = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: mockDataURL)
                let jsonData =  try JSONDecoder().decode(T.self, from: data)
                return jsonData
            } catch {
                throw AppError.jsonDataError
            }
        } else {
            throw AppError.unknown
        }
    }
}
