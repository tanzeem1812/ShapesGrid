protocol APIService {
    var url:String {get set}
    func fetchDataRequest<T:Decodable> () async throws -> T
}
