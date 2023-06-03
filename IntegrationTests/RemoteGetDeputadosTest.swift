import XCTest
import Infra
import Data

final class RemoteGetDeputadosTest: XCTestCase {
    
    func test_get_deputados(){
        let url = URL(string: "https://www.camara.leg.br/SitCamaraWS/Deputados.asmx/ObterDeputados")!
        let urslSessionAdapter = URLSessionAdapter()
        let sut = RemoteGetDeputados(url: url, httpClient: urslSessionAdapter)
        
        let exp = expectation(description: "waiting")
        
        sut.getDeputados() { result in
            switch result {
                case .failure: XCTFail("Expect succcess got \(result) instead")
                case .success(let deputados):
                XCTAssertNotEqual(deputados.count, 0)
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
        
    }
}
