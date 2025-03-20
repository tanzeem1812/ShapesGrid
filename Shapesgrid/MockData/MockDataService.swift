import Foundation

struct MockDataService: APIService {
    var url = ""
    let jsonFileName:String
    func fetchDataRequest<T:Decodable>() async throws -> T {
        do {
            let data = try MockData<T>.mockDataForJsonFile(fileName:jsonFileName)
            return data
        } catch {
            throw error
        }
    }
}

