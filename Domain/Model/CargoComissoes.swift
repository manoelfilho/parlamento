import Foundation

public struct CargoComissoes: Model {
    
    //MARK: Properties
    let idOrgaoLegislativoCD: Int?
    let siglaComissao: String?
    let nomeComissao: String?
    let idCargo: Int?
    let nomeCargo: String?
    let dataEntrada: String?
    let dataSaida: String?
    
    //MARK: Init
    public init(idOrgaoLegislativoCD: Int?, siglaComissao: String?, nomeComissao: String?, idCargo: Int?, nomeCargo: String?, dataEntrada: String?, dataSaida: String?) {
        self.idOrgaoLegislativoCD = idOrgaoLegislativoCD
        self.siglaComissao = siglaComissao
        self.nomeComissao = nomeComissao
        self.idCargo = idCargo
        self.nomeCargo = nomeCargo
        self.dataEntrada = dataEntrada
        self.dataSaida = dataSaida
    }
    
    private enum CodingKeys: String, CodingKey {
        case idOrgaoLegislativoCD
        case siglaComissao
        case nomeComissao
        case idCargo
        case nomeCargo
        case dataEntrada
        case dataSaida
    }
    
}
