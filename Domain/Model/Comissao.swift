import Foundation

public struct Comissao {
    
    //MARK: Properties
    let idOrgaoLegislativoCD: Int?
    let siglaComissao: String?
    let nomeComissao: String?
    let condicaoMembro: String?
    let dataEntrada: String?
    let dataSaida: String?
    
    //MARK: Init
    public init(idOrgaoLegislativoCD: Int?, siglaComissao: String?, nomeComissao: String,  condicaoMembro: String?, dataEntrada: String?, dataSaida: String?){
        self.idOrgaoLegislativoCD = idOrgaoLegislativoCD
        self.siglaComissao = siglaComissao
        self.nomeComissao = nomeComissao
        self.condicaoMembro = condicaoMembro
        self.dataEntrada = dataEntrada
        self.dataSaida = dataSaida
    }
}




