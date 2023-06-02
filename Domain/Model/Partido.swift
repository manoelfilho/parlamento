import Foundation

public struct Partido: Model {
    
    //MARK: Properties
    let idPartido: Int?
    let sigla: String?
    let nome: String?
    
    //MARK: Init
    public init(id: Int?, sigla: String?, nome: String?){
        self.idPartido = id
        self.sigla = sigla
        self.nome = nome
    }
    
    private enum CodingKeys: String, CodingKey {
        case idPartido
        case sigla
        case nome
    }

    
}
