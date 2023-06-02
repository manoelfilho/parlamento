import Foundation
import Alamofire
import Data

public final class AlamofireAdapter: HttpGetClient {
    
    private let session: Session
    
    public init (session: Session = .default){
        self.session = session
    }
    
    public func get(to url: URL, completion: @escaping (Result<Data?, HttpError>) -> Void) {
        
        session.request(url, method: .get).responseData { [weak self] dataResponse in
            
            guard self != nil else { return }
            
            guard let statusCode = dataResponse.response?.statusCode else {
                return completion(.failure(.unexpected))
            }
            
            switch dataResponse.result {
            
            case .failure: completion(.failure(.unexpected))
            
            case .success(let data):
                
                switch statusCode {
                    
                    case 204:
                        completion(.success(nil))
                    case 200...299:
                        completion(.success(data))
                    case 401:
                        completion(.failure(.unauthorized))
                    case 403:
                        completion(.failure(.forbiden))
                    case 400...499:
                        completion(.failure(.badRequest))
                    case 500...599:
                        completion(.failure(.serverError))
                    default:
                        completion(.failure(.unexpected))
                }
                
            }
            
        }
        
    }
    
}
