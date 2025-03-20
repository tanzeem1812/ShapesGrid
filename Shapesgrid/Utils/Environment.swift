import Foundation

public enum Environment { // Keep Adding more environment keys here e.g API_KEY
    enum Keys {
        static let baseUrl = "BASE_URL"
    }
    
    private static let infoDictionary:[String:Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError(String(localized: "PLISTNOFOUND"))
        }
        return dict
    }()
    
    static let baseURL:String = {
        guard let baseURLString = infoDictionary[Keys.baseUrl] as? String else {
            fatalError(String(localized: "BASEURLNOTFOUND"))
        }
        return baseURLString
    }()
}
