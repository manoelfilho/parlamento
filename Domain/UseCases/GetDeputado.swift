import Foundation

public protocol GetDeputado {
    func getDeputado(completion: @escaping (Result<Deputado, DomainError>) -> Void)
}
