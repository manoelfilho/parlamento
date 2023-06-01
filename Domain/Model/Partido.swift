import Foundation

public struct Partido {
    
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
    
}
