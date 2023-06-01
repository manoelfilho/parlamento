import Foundation

public struct Gabinete {
    
    //MARK: Properties
    let numero: Int?
    let anexo: Int?
    let telefone: String?
    
    //MARK: Init
    public init(numero: Int?, anexo: Int?, telefone: String?){
        self.numero = numero
        self.anexo = anexo
        self.telefone = telefone
    }
}
