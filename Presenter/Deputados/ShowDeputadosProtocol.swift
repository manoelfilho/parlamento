import Foundation
import Domain

public protocol ShowDeputadosProtocol: AnyObject {
    func showDeputados(with: [Deputado])
    func showErrorGettingDeputados(with: String)
    func toggleLoading()
}
