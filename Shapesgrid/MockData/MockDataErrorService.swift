import Foundation

struct MockDataErrorService: APIService {
    var url:String = ""
    func fetchDataRequest<T:Decodable>() async throws -> T {
        throw AppError.serverError
    }
}
