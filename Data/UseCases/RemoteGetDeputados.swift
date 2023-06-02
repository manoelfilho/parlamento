import Foundation
import Domain

public final class RemoteGetDeputados: GetDeputadosProtocol {
    
    private let url: URL
    private let httpClient: HttpGetClient
    
    public init(url: URL, httpClient: HttpGetClient){
        self.url = url
        self.httpClient = httpClient
    }
    
    public func getDeputados(completion: @escaping (Result<Deputados, DomainError>) -> Void) {
        
        httpClient.get(to: url) { [weak self] result in
            
            guard self != nil else { return }
            
            switch result {
                
            case .success(let data):
                if let model: Deputados = data?.toModel() {
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
                    case .serverError:
                        completion(.failure(.serverError))
                }
                
            }
            
        }
        
        
    }
    
}
