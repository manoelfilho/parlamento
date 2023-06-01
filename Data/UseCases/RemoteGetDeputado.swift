import Foundation
import Domain

public final class RemoteGetDeputado: GetDeputadoProtocol {
    
    private let url: URL
    private let httpClient: HttpGetClient
    
    public init(url: URL, httpClient: HttpGetClient){
        self.url = url
        self.httpClient = httpClient
    }
    
    public func getDeputado(completion: @escaping (Result<Deputado, DomainError>) -> Void) {
        
        httpClient.get(to: url) { [weak self] result in
            
            guard self != nil else { return }
            
            switch result {
                
            case .success(let data):
                if let model: Deputado = data?.toModel() {
                    completion(.success(model))
                } else {
                    completion(.failure(.unexpected))
                }
                
            case .failure(let error):
                
                switch error{
                    case .unexpected:
                        completion(.failure(.unexpected))
                    case .badRequest:
                        completion(.failure(.badRequest))
                    case .unauthorized:
                        completion(.failure(.unauthorized))
                    case .apiError:
                        completion(.failure(.apiError))
                    case .forbiden:
                        completion(.failure(.forbiden))
                }
                
            }
            
        }
        
        
    }
    
}
