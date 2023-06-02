import Foundation

public struct ItemHistoricoLider: Model {
    
    //MARK: Properties
    let idHistoricoLider: Int?
    let idCargoLideranca: Int?
    let descricaoCargoLideranca: String?
    let numOrdemCargo: Int?
    let dataDesignacao: String?
    let dataTermino: String?
    let codigoUnidadeLideranca: String?
    let siglaUnidadeLideranca: String?
    let idBlocoPartido: String?
    
    //MARK: Init
    public init(idHistoricoLider: Int?, idCargoLideranca: Int?, descricaoCargoLideranca: String?, numOrdemCargo: Int?, dataDesignacao: String?, dataTermino: String?, codigoUnidadeLideranca: String?, siglaUnidadeLideranca: String?, idBlocoPartido: String?) {
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
    
    private enum CodingKeys: String, CodingKey {
        case idHistoricoLider
        case idCargoLideranca
        case descricaoCargoLideranca
        case numOrdemCargo
        case dataDesignacao
        case dataTermino
        case codigoUnidadeLideranca
        case siglaUnidadeLideranca
        case idBlocoPartido
    }
    
}

