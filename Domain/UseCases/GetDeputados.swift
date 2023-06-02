import Foundation

public protocol GetDeputadosProtocol {
    func getDeputados(completion: @escaping (Result<Deputados, DomainError>) -> Void)
}
