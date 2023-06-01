import Foundation

public struct FiliacaoPartidaria {
    
    //MARK: Properties
    let idPartidoAnterior: Int?
    let siglaPartidoAnterior: String?
    let nomePartidoAnterior: String?
    let idPartidoPosterior: Int?
    let siglaPartidoPosterior: String?
    let nomePartidoPosterior: String?
    let dataFiliacaoPartidoPosterior: String?

    
    //MARK: Init
    public init(idPartidoAnterior: Int?, siglaPartidoAnterior: String?, nomePartidoAnterior: String?, idPartidoPosterior: Int?, siglaPartidoPosterior: String?, nomePartidoPosterior: String?, dataFiliacaoPartidoPosterior: String?) {
        self.idPartidoAnterior = idPartidoAnterior
        self.siglaPartidoAnterior = siglaPartidoAnterior
        self.nomePartidoAnterior = nomePartidoAnterior
        self.idPartidoPosterior = idPartidoPosterior
        self.siglaPartidoPosterior = siglaPartidoPosterior
        self.nomePartidoPosterior = nomePartidoPosterior
        self.dataFiliacaoPartidoPosterior = dataFiliacaoPartidoPosterior
    }
    
}

