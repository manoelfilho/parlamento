import Foundation

public protocol GetDeputadoProtocol {
    func getDeputado(completion: @escaping (Result<Deputado, DomainError>) -> Void)
}
