import XCTest
import Data

final class GetDeputadoTest: XCTestCase {

    func test_get_should_call_http_get_client_with_correct_url(){
        let url: URL = URL(string: "http://any-url")!
        let (sut, httpGetClientSpy) = makeSut()
        sut.getDeputado { _ in }
        XCTAssertEqual(url, httpGetClientSpy.url)
    }
    
    func test_get_should_complete_with_deputado_if_clients_completes_with_valid_data(){
        let (sut, httpGetClientSpy) = makeSut()
        let exp = expectation(description: "waiting")
        
        let expectedDeputado = makeDeputado()
        
        sut.getDeputado { result in
            switch result {
                case .failure: XCTFail("Expected deputado and receive a result \(result) instead")
                case .success(let receivedDeputado): XCTAssertEqual(receivedDeputado, expectedDeputado)
            }
            exp.fulfill()
        }
        httpGetClientSpy.completeWithData(makeDeputadoDataXml())
        wait(for: [exp], timeout: 1)
        
    }

}

extension GetDeputadoTest {
    
    func makeSut(url: URL = URL(string: "http://any-url")!) -> (sut: RemoteGetDeputado, httpClientSpy: HttpGetClientSpy){
        let httpClientSpy = HttpGetClientSpy()
        let sut = RemoteGetDeputado(url: url, httpClient: httpClientSpy)
        addTeardownBlock { [weak sut] in
            XCTAssertNil(sut)
        }
        return (sut, httpClientSpy)
    }
    
    class HttpGetClientSpy: HttpGetClient {
        var url: URL?
        var completion: ((Result<Data?, HttpError>) -> Void)?
        
        func get(to url: URL, completion: @escaping (Result<Data?, HttpError>) -> Void) {
            self.url = url
            self.completion = completion
        }
        
        func completeWithData( _ data: Data){
            completion?(.success(data))
        }
        
        func completeWithError( _ error: HttpError){
            completion?(.failure(error))
        }
        
    }
    
}
