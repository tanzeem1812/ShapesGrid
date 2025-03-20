import Foundation

enum AppError : Error, Equatable {
    case clientError
    case redirection
    case badResponse
    case serverError
    case jsonDataError
    case invalidUrl
    case invalidData
    case unknown
}

extension AppError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .redirection:
            return String(localized: "REDIRECTION")
        case .invalidData:
            return String(localized: "INVALIDDATA")
        case .serverError:
            return String(localized:"SERVERERROR")
        case .jsonDataError:
            return String(localized:"JSONDATAERROR")
        case .invalidUrl:
            return String(localized:"INVALIDURLERROR")
        case .badResponse:
            return String(localized:"BADRESPONSEERROR")
        case .clientError:
            return String(localized:"CLIENTERROR")
        case .unknown:
            return String(localized:"UNKNOWNERROR")
        }
    }
}
