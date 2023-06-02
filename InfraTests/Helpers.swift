import Foundation
import XCTest

extension XCTestCase {
    
    func checkMemoryLeak(for instance: AnyObject, file: StaticString = #filePath, line: UInt = #line){
        //addTeardownBlock é chamado no final de todos os testes. a instancia deve ser weak
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, file: file, line: line)
        }
    }
    
    func makeEmptyData() -> Data{
        return Data()
    }
    
    func makeValidData() -> Data{
        let data = """
        <?xml version="1.0" encoding="utf-8"?>
        <deputados>
          <deputado>
            <ideCadastro>73701</ideCadastro>
            <codOrcamento>1310</codOrcamento>
            <condicao>Titular</condicao>
            <matricula>291</matricula>
            <idParlamentar>1660902</idParlamentar>
            <nome>BENEDITA SOUZA DA SILVA SAMPAIO</nome>
            <nomeParlamentar>Benedita da Silva</nomeParlamentar>
            <urlFoto>http://www.camara.gov.br/internet/deputado/bandep/73701.jpg</urlFoto>
            <sexo>feminino</sexo>
            <uf>RJ</uf>
            <partido>PT</partido>
            <gabinete>330</gabinete>
            <anexo>4</anexo>
            <fone>3215-5330</fone>
            <email>dep.beneditadasilva@camara.leg.br</email>
            <comissoes>
              <titular />
              <suplente />
            </comissoes>
          </deputado>
          <deputado>
            <ideCadastro>74090</ideCadastro>
            <codOrcamento>1619</codOrcamento>
            <condicao>Titular</condicao>
            <matricula>38</matricula>
            <idParlamentar>1660903</idParlamentar>
            <nome>ÁTILA SIDNEY LINS DE ALBUQUERQUE</nome>
            <nomeParlamentar>Átila Lins</nomeParlamentar>
            <urlFoto>http://www.camara.gov.br/internet/deputado/bandep/74090.jpg</urlFoto>
            <sexo>masculino</sexo>
            <uf>AM</uf>
            <partido>PSD</partido>
            <gabinete>730</gabinete>
            <anexo>4</anexo>
            <fone>3215-5730</fone>
            <email>dep.atilalins@camara.leg.br</email>
            <comissoes>
              <titular />
              <suplente />
            </comissoes>
          </deputado>
        </deputados>
        """;
        return Data(data.utf8)
    }
    
    func makeInvalidData() -> Data{
        return Data("invalid_data".utf8)
    }

    func makeUrl() -> URL {
        return URL(string: "http://any-url.com.br")!
    }
    
    func makeError() -> Error{
        return NSError(domain: "any-error", code: 0)
    }
    
    func makeHttpResponse(statusCode: Int = 200) -> HTTPURLResponse? {
        return HTTPURLResponse(url: makeUrl(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
    }
}
