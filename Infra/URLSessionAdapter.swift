import Foundation
import Data

public final class URLSessionAdapter: HttpGetClient {
    
    let urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession.shared){
        self.urlSession = urlSession
    }
    
    public func get(to url: URL, completion: @escaping (Result<Data?, HttpError>) -> Void) {
            
        let dataTask = urlSession.dataTask(with: url) { [weak self] (data, urlResponse, error) in
            
            guard let self = self else { return }
            
            if let error = error {
                completion(.failure(.networkError))
                return
            }
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                completion(.failure(.unexpected))
                return
            }
            
            let statusCode = httpResponse.statusCode
            
            switch statusCode {
                case 200..<300:
                    if let responseData = data {
                        completion(.success(responseData))
                    } else {
                        completion(.failure(.emptyResponse))
                    }
                case 400..<500:
                    completion(.failure(.unauthorized))
                case 500..<600:
                    completion(.failure(.serverError))
                default:
                    completion(.failure(.unexpected))
            }
            
        }
        
        dataTask.resume()
        
    }

}
