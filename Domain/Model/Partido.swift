import Foundation

public struct Partido: Model {
    
    //MARK: Properties
    let id: Int?
    let sigla: String?
    let nome: String?
    
    //MARK: Init
    public init(id: Int?, sigla: String?, nome: String?){
        self.id = id
        self.sigla = sigla
        self.nome = nome
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case sigla
        case nome
    }

    
}
