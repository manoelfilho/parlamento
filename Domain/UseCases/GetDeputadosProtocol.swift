import Foundation

public protocol GetDeputadosProtocol {
    func getDeputados(completion: @escaping (Result<[Deputado], DomainError>) -> Void)
}
