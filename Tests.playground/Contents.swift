import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

guard let url = URL(string: "https://www.camara.leg.br/SitCamaraWS/Deputados.asmx/ObterDeputados") else {
    print("URL inválida.")
    PlaygroundPage.current.finishExecution()
}

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    defer {
        PlaygroundPage.current.finishExecution()
    }
    
    if let error = error {
        print("Erro na solicitação: \(error)")
        return
    }
    
    guard let data = data else {
        print("Dados ausentes na resposta.")
        return
    }
    
    if let content = String(data: data, encoding: .utf8) {
        print("Conteúdo da resposta:\n\(content)")
    } else {
        print("Não foi possível converter os dados em uma string.")
    }
}

task.resume()
