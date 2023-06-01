import Foundation

public protocol GetDeputados {
    func getDeputados(completion: @escaping (Result<[Deputado], DomainError>) -> Void)
}
