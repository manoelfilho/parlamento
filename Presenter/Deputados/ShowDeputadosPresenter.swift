import Foundation
import Domain

class ShowDeputadosPresenter {
    
    private let getDeputadosService: GetDeputadosProtocol
    weak private var showDeputadosProtocol: ShowDeputadosProtocol?
    
    init(getDeputadosService: GetDeputadosProtocol) {
        self.getDeputadosService = getDeputadosService
    }
    
    func setViewDelegte(deputadosProtocol: ShowDeputadosProtocol?){
        self.showDeputadosProtocol = deputadosProtocol
    }
    
    func getDeputados() {
        getDeputadosService.getDeputados { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let deputados):
                self?.showDeputadosProtocol?.showDeputados(with: deputados)
            case .failure(_):
                self?.showDeputadosProtocol?.showErrorGettingDeputados(message: "Erro no retorno dos dados")
            }
            self?.showDeputadosProtocol?.toggleLoading()
        }
    }
    
}
