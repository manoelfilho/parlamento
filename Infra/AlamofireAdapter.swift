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
                
                case .failure(_):
                    completion(.failure(.networkError))
                    
                case .success(let data):
                    switch statusCode {
                        
                        case 200..<300:
                            if statusCode == 204 {
                                completion(.success(nil))
                            } else {
                                completion(.success(data))
                            }
                            
                        case 400..<500:
                            completion(.failure(.unauthorized))
                            
                        case 500..<600:
                            completion(.failure(.serverError))
                            
                        default:
                            completion(.failure(.unexpected))
                    }
            }
            
        }
        
    }

    
}
