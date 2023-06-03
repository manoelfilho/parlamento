import Foundation
import Domain

public protocol ShowDeputadosProtocol: AnyObject {
    func showDeputados(with: [Deputado])
    func showErrorGettingDeputados(message: String)
    func toggleLoading()
}
