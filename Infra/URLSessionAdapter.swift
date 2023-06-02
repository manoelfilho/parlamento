import Foundation
import Data

public final class URLSessionAdapter: HttpGetClient {
    
    let urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession.shared){
        self.urlSession = urlSession
    }
    
    public func get(to url: URL, completion: @escaping (Result<Data?, HttpError>) -> Void) {
        
        let dataTask = urlSession.dataTask(with: url){ [weak self] (data, urlResponse, error) in
            
            guard self != nil else { return }
            
            do {
                
                if let error = error { throw error }
                
                guard let httpResponse = urlResponse as? HTTPURLResponse, 200 ..< 300 ~= httpResponse.statusCode else {
                    completion(.failure(.unexpected))
                    return
                }
                
                if let responseData = data {
                    completion(.success(responseData))
                } else {
                    completion(.failure(.badRequest))
                }
                
            } catch {
                completion(.failure(.badRequest))
            }
            
        }
        
        dataTask.resume()
        
    }

}
