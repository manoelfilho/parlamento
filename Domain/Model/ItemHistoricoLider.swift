import Foundation

public struct ItemHistoricoLider {
    
    //MARK: Properties
    let idHistoricoLider: String?
    let idCargoLideranca: String?
    let descricaoCargoLideranca: String?
    let numOrdemCargo: String?
    let dataDesignacao: String?
    let dataTermino: String?
    let codigoUnidadeLideranca: String?
    let siglaUnidadeLideranca: String?
    let idBlocoPartido: String?
    
    //MARK: Init
    public init(idHistoricoLider: String?, idCargoLideranca: String?, descricaoCargoLideranca: String?, numOrdemCargo: String?, dataDesignacao: String?, dataTermino: String?, codigoUnidadeLideranca: String?, siglaUnidadeLideranca: String?, idBlocoPartido: String?) {
        self.idHistoricoLider = idHistoricoLider
        self.idCargoLideranca = idCargoLideranca
        self.descricaoCargoLideranca = descricaoCargoLideranca
        self.numOrdemCargo = numOrdemCargo
        self.dataDesignacao = dataDesignacao
        self.dataTermino = dataTermino
        self.codigoUnidadeLideranca = codigoUnidadeLideranca
        self.siglaUnidadeLideranca = siglaUnidadeLideranca
        self.idBlocoPartido = idBlocoPartido
    }
    
}

