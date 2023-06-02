import Foundation
import XMLCoder
import Domain

public extension Data {
    
    func toModel<T: Decodable>() -> T? {                
        do {
            let decoder = XMLDecoder()
            decoder.shouldProcessNamespaces = true
            return try decoder.decode(T.self, from: self)
        } catch {
            print(">>>")
            print(error.localizedDescription)
            print(">>>")
        }
        return nil
    }
    
    func toJson() -> [String: Any]? {
        return try? JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: Any]
    }

    
}
