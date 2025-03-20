import Foundation

struct DataAPIService : APIService {
    var url:String
    
    init(url:String) {
        self.url = url
    }
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        // if required, configure decoder for other settings
        // .eg  decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func fetchDataRequest<T:Decodable>() async throws -> T {
        guard url.isValidURL, let url = URL(string: self.url) else {
            throw AppError.invalidUrl
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse else {
            throw AppError.badResponse
        }
        switch response.statusCode {
        case (200...299):
            do {
                let apiResponse = try jsonDecoder.decode(T.self, from: data)
                return apiResponse
            } catch {
                throw AppError.jsonDataError
            }
        case 300..<400:
            throw AppError.redirection
        case 400..<500:
            print(response.description)
            throw AppError.clientError
        case 500..<600:
            throw AppError.serverError
        default:
            throw AppError.unknown
        }
    }
}
