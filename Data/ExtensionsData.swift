import Foundation
import Domain

public extension Data {
    
    func toModel<T: Decodable>() -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: self)
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
    

    func toModelArray() -> [Deputado] {
        do {
            return try JSONDecoder().decode([Deputado].self, from: self)
        } catch {
            print(">>>")
            print(error.localizedDescription)
            print(">>>")
        }
        return []
    }

    
}
