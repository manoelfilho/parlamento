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
    
}
